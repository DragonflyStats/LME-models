https://featuredcontent.psychonomic.org/putting-ps-into-lmer-mixed-model-regression-and-statistical-significance/

Statistics and Methodology	
Putting p’s into lmer: mixed-model regression and statistical significance
BY Richard Morey | July 6, 2017 | No Comments
Other Posts By Richard Morey	

Since Herb Clark published his famous “Language as a fixed effect fallacy” in 1973, there has been a slow realization that standard techniques, such as ANOVA, are the wrong tools for the jobs that most psychologists tackle. The basic problem is that most psychological questions involve generalization beyond a sample of people and beyond a sample of stimuli.

Psychologists often average over the effects of their various stimuli, not realizing that they should be including variability due to stimuli in their analyses. In short, researchers are asking a question about a population of stimuli (“Do these types of stimuli have different effects?” — maybe, maybe not); but they are answering a question about a sample of stimuli (“do these 10 stimuli have different effects from these other 10?” — almost surely). This problem contributes to both false positives and low replicability in many areas of research, including linguistics, memory and neuroimaging.

To combat this common problem, many psychologists now use linear mixed models as part of their statistical toolkit. Mixed models allow accounting for of multiple sources of variability simultaneously (see Dirk Janssen’s 2012 tutorial in the Psychonomic Society’s journal Behavior Research Methods). Mixed models also handle unbalanced designs with ease, and are flexible enough to include continuous predictors and correlations between effects beyond what a typical repeated measures ANOVA can handle.

One of the most common software packages used for mixed modelling is Douglas Bates’ lme4 package for R, which provides an easy-to-use interface for estimation and inference. Readers unfamiliar with lme4 may wish to consult the highly accessible tutorial paper in the Journal of Memory and Language by Baayen, Davidson, and Bates.

One thing that surprises new users of lme4 is that although the output of lme4 looks like standard regression output with estimates, standard errors, and t values, its output does not include p values. Bates explained the statistical reasoning behind this omission 10 years ago. The desire for p values is so strong in some research areas that Bates says “failure to [include p values] is a sign of inattention or, worse, incompetence on the part of the person who wrote lmer (i.e. me).”

Of course, there’s no particular reason why a researcher needs an exact p value; many scientists are happy interpreting the size of effect relative to its standard error (in this case, the t statistic). Physicists, for instance, speak of “five sigma” effects, which means that the observed effect was five times the standard error. The question is: can you predictably and repeatedly find an effect that is many standard errors away from a hypothesized value, in a particular direction?

The figure below shows the default output from lme4, which includes estimates, standard errors, and t values, but no p values.

But current reporting standards are what they are in psychology, and people want p values. 

In a recent article in the Psychonomic Society’s journal Behavior Research Methods, Steven Luke reviews the ways of obtaining p values with an lme4 analysis. As Bates points out, there are multiple ways of doing this, but this is beyond the concern of most users of linear mixed models. What users want to know is: if they use a particular method, will the p values lead to wrong inferences? Luke evaluates a number of methods and finds that 1) they all perform reasonably similarly, 2) almost all yield slightly, but not substantially, inflated Type I error error rates (up to 8% when using p<.05 as a criterion).

Luke’s work is useful for a number of reasons: first, it provides a summary of the methods in one location. References to these methods can be found scattered across various articles, software packages or blog posts, so having them in one place is handy. Second, Luke provides simulations under a number of simple designs that are typical of those used by researchers, in terms of the number of participants and items. Third, Luke provides example R code in the appendix showing how to obtain the p values, and the simulation code is available on the Open Science Framework.

Finally, Luke arrives at some general guidelines based on the simulations. Treating the t statistic as a z value — and hence using a criterion of about t>2 as the criterion for significance — was associated with a somewhat inflated Type I error rate, and hence Luke suggests this method should be avoided. The Kenward-Roger and Satterthwaite approximations, both implemented in the easy-to-use lmerTest and afex R packages, fared best. One of the advantages of lmerTest and afex is that all one has to do is load the package in R, and the output of lmer is automatically updated to include the p values. For the user of linear mixed effect models, such transparency is a boon.

To illustrate, the figure below shows the output after loading the lmerTest package. A linear mixed model analyses using lmer will automatically include p values computed via the Satterthwaite approximation.

Importantly, however, Luke re-iterates the point that the p values themselves should not be thought of as the primary number of interest. As Luke puts it, “the user is encouraged to make decisions based on an informed judgment of the parameter estimates and their standard errors, and not to rely wholly or blindly on p-values, no matter how they were obtained.”
Article focused on in this post:

Luke, S. G. (2016). Evaluating significance in linear mixed-effects models in R. Behavior Research Methods. DOI: 10.3758/s13428-016-0809-y

