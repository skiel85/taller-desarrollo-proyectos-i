namespace ZoosManagementSystem.Web.Controllers
{
    using System;
    using System.Collections.Generic;
    using System.Globalization;
    using System.Web.Mvc;
    using System.Linq;
    using System.Web.Routing;

    using ZoosManagementSystem.Web.Models;
    using ZoosManagementSystem.Web.ViewData;

    public class AdministrationController : Controller
    {
        private readonly IZooCatalogRepository repository;

        public AdministrationController(IZooCatalogRepository repository)
        {
            this.repository = repository;
        }

        public AdministrationController(): this(new SqlZooCatalogRepository())
        {
        }

        public ActionResult Index()
        {
            return this.View();
        }

        public ActionResult Environments()
        {
            var environments = this.repository.GetEnvironments();
            this.TempData["NoItemsMessage"] = "�No hay ambientes disponibles para el Zool�gico!";

            if (this.Request.Path.EndsWith("/Administration/Environments"))
            {
                this.TempData["EnvironmentMessage"] = null;
                this.TempData["ActionSucess"] = null;
                this.TempData["SearchCriteria"] = null;
            }

            return this.View("Environments", environments);
        }

        public ActionResult SearchEnvironments(string searchCriteria)
        {
            this.TempData["NoItemsMessage"] = "No se encontraron ambientes.";
            this.TempData["SearchCriteria"] = searchCriteria;
            IList<Models.Environment> environments = null;

            if (!string.IsNullOrEmpty(searchCriteria))
            {
                environments = this.repository.SearchEnvironments(searchCriteria); 
            }

            return this.View("Environments", environments);
        }

        public ActionResult DeleteEnvironment(string environmentId)
        {
            try
            {
                this.TempData["ActionSucess"] = true;
                this.TempData["EnvironmentMessage"] = "El ambiente se elimin� correctamente.";

                if (!this.repository.DeleteEnvironment(new Guid(environmentId)))
                {
                    this.TempData["ActionSucess"] = false;
                    this.TempData["EnvironmentMessage"] = string.Format(
                        CultureInfo.CurrentCulture, "No se encontr� ning�n ambiente cuyo Id sea {0}.", environmentId);
                }
            }
            catch (FormatException)
            {
                this.TempData["ActionSucess"] = false;
                this.TempData["EnvironmentMessage"] = string.Format(
                    CultureInfo.CurrentCulture, "El formato del Id '{0}' es inv�lido.", environmentId);
            }
            catch(OverflowException)
            {
                this.TempData["ActionSucess"] = false;
                this.TempData["EnvironmentMessage"] = string.Format(
                    CultureInfo.CurrentCulture, "El formato del Id '{0}' es inv�lido.", environmentId);
            }

            return this.Environments();                
        }

        public ActionResult EditEnvironment(string environmentId)
        {
            EnvironmentViewData environmentViewData = null;

            try
            {
                this.TempData["EditMessage"] = null;
                var environment = this.repository.GetEnvironment(new Guid(environmentId));

                if (environment == null)
                {
                    this.TempData["EditMessage"] = string.Format(
                        CultureInfo.CurrentCulture, "No se encontr� ning�n ambiente cuyo Id sea {0}.", environmentId);
                }
                else
                {
                    environmentViewData = environment.ToViewData(this.repository);
                }
            }
            catch (FormatException)
            {
                this.TempData["EditMessage"] = string.Format(
                    CultureInfo.CurrentCulture, "El formato del Id '{0}' es inv�lido.", environmentId);
            }
            catch (OverflowException)
            {
                this.TempData["EditMessage"] = string.Format(
                    CultureInfo.CurrentCulture, "El formato del Id '{0}' es inv�lido.", environmentId);
            }

            return this.View(environmentViewData);  
        }


        public ActionResult NewEnvironment()
        {
            var environmentViewData = new EnvironmentViewData
                {
                    FreeAnimals = this.repository.GetFreeAnimals()
                            .Select(a => a.ToViewData())
                            .ToList()
                };
            
            return this.View("EditEnvironment", environmentViewData);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [ActionName("NewEnvironment")]
        public ActionResult SaveNewEnvironment()
        {
            var environmentViewData = new EnvironmentViewData();
            var updateModelResult = this.TryUpdateModel<EnvironmentViewData>(environmentViewData, null, null, new[] { "EnvironmentId", "freeanimals" });

            if (!updateModelResult)
            {
                environmentViewData.FreeAnimals = this.repository.GetFreeAnimals()
                    .Select(a => a.ToViewData())
                    .ToList();
                return View("EditEnvironment", environmentViewData);
            }

            Guid environmentId = Guid.Empty;
            try
            {
                environmentId = this.repository.CreateEnvironment(environmentViewData);
                this.TempData["ActionSucess"] = true;
                this.TempData["EnvironmentMessage"] = "Se cre� correctamente el ambiente";
            }
            catch (Exception exception)
            {
                this.TempData["ActionSucess"] = false;
                this.TempData["EnvironmentMessage"] = exception.Message;
            }

            return this.RedirectToRoute("SearchEnvironment", new { searchCriteria = environmentId.ToString() });
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [ActionName("EditEnvironment")]
        public ActionResult UpdateEnvironment(string environmentId)
        {
            var environmentViewData = new EnvironmentViewData();
            var updateModelResult = this.TryUpdateModel<EnvironmentViewData>(environmentViewData, null, null, new [] { "EnvironmentId", "freeanimals" });

            if (!updateModelResult)
            {
                environmentViewData.FreeAnimals = this.repository.GetFreeAnimals()
                    .Select(a => a.ToViewData())
                    .ToList();
                return View(environmentViewData);
            }

            try
            {
                environmentViewData.EnvironmentId = environmentId;
                this.repository.UpdateEnvironment(environmentViewData);
                this.TempData["ActionSucess"] = true;
                this.TempData["EnvironmentMessage"] = "Se edit� correctamente el ambiente";
            }
            catch (Exception exception)
            {
                this.TempData["ActionSucess"] = false;
                this.TempData["EnvironmentMessage"] = exception.Message;
            }

            return this.RedirectToRoute("SearchEnvironment", new { searchCriteria = environmentViewData.EnvironmentId });
        }

        public ActionResult Animals()
        {
            var animals = this.repository.GetAnimals();
            this.TempData["NoItemsMessage"] = "�No hay animales disponibles para el Zool�gico!";

            if (this.Request.Path.EndsWith("/Administration/Animals"))
            {
                this.TempData["AnimalMessage"] = null;
                this.TempData["ActionSucess"] = null;
                this.TempData["SearchCriteria"] = null;
            }

            return this.View("Animals", animals);
        }

        public ActionResult SearchAnimals(string searchCriteria)
        {
            this.TempData["NoItemsMessage"] = "No se encontraron animales.";
            this.TempData["SearchCriteria"] = searchCriteria;
            IList<Models.Animal> animals = null;

            if (!string.IsNullOrEmpty(searchCriteria))
            {
                animals = this.repository.SearchAnimals(searchCriteria);
            }

            return this.View("Animals", animals);
        }

        public ActionResult DeleteAnimal(string animalId)
        {
            try
            {
                this.TempData["ActionSucess"] = true;
                this.TempData["AnimalMessage"] = "El animal se elimin� correctamente.";

                if (!this.repository.DeleteAnimal(new Guid(animalId)))
                {
                    this.TempData["ActionSucess"] = false;
                    this.TempData["AnimalMessage"] = string.Format(
                        CultureInfo.CurrentCulture, "No se encontr� ning�n animal cuyo Id sea {0}.", animalId);
                }
            }
            catch (FormatException)
            {
                this.TempData["ActionSucess"] = false;
                this.TempData["AnimalMessage"] = string.Format(
                    CultureInfo.CurrentCulture, "El formato del Id '{0}' es inv�lido.", animalId);
            }
            catch (OverflowException)
            {
                this.TempData["ActionSucess"] = false;
                this.TempData["AnimalMessage"] = string.Format(
                    CultureInfo.CurrentCulture, "El formato del Id '{0}' es inv�lido.", animalId);
            }

            return this.Animals();
        }
    }
}