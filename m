Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A35DA2A2812
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Nov 2020 11:18:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CFF843C302B
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Nov 2020 11:18:19 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 530C03C23BB
 for <ltp@lists.linux.it>; Mon,  2 Nov 2020 11:18:15 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id DCC4E1401642
 for <ltp@lists.linux.it>; Mon,  2 Nov 2020 11:18:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604312292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1e8HgusRwHn0VXDqSq+fyzCZXeGAeXASLrUW1SSBIzo=;
 b=h8Ip8t1UCSAabAkQLndk/ZPd3GMb2YyaeUz44W+CebHkRrw+hI40dcZ+IL5EKDlu93lalb
 tT9T0t7os0goBQT4+X/GWQv15+ZuZtVeERQw3ulE5X6A9xlL3Lq0D7sOZ1xRnmptvMuFki
 rEi5TQMj0ZNF/rhShEQ7n+M+oZ8CsKU=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-JZ_HPNGEOPe7Uu3AGUvJwg-1; Mon, 02 Nov 2020 05:18:08 -0500
X-MC-Unique: JZ_HPNGEOPe7Uu3AGUvJwg-1
Received: by mail-yb1-f197.google.com with SMTP id j10so13478362ybl.19
 for <ltp@lists.linux.it>; Mon, 02 Nov 2020 02:18:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1e8HgusRwHn0VXDqSq+fyzCZXeGAeXASLrUW1SSBIzo=;
 b=se0wXtTecqJD3RPN/+kEN7v0vOlDQoHHOY94A0NBoqGUWynyLFRxnn201FX3tJiGSY
 YJEqSmUB6i4xEOhMyLADDPIivoVjvUQNwDEglOlVlJJgPPyv1Jk0gV5b/f5KYetXQZdK
 PdSh1x0G1R4ym3hLDVyHe0NIb9Bp5zS6HoskEr7tmCtwn44uaABWyxeLso4oix6+DG9E
 K/HhjWh/fyYP8R4PPxQoWhNMFaSLd+T/DcQyjvQJJabso1amNWuVF7urvke0Ln98rhal
 nVvnFW7b3QHLWqJST7yX0L2DHIGzNfeCZb4cOH7kl3gNWj8kxds+xTHdFkBOC8/QQrSH
 DiLQ==
X-Gm-Message-State: AOAM533ThXQV3OjNBsUODcd1lC37V4RV8GrmBaFAZ/xugnmGd6wzkFoI
 vrrf0bBu9PE/c1tZImEvdw0zna9WtR0fKuCvP7FezdYTUG2BL+hlQYmL/9P6VTJ8UR0iffKp0qq
 78W21vR7jh4CoAZrsCB5+pUlN50A=
X-Received: by 2002:a25:3417:: with SMTP id b23mr19512373yba.97.1604312287775; 
 Mon, 02 Nov 2020 02:18:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw/uhpDYxF6pe1HPudgPSpw97bGa97dRSrydLPd75fKHOdnpXyS62uUi0hfi4Rm/K//GF7XyFhAz5ml6sDk9qc=
X-Received: by 2002:a25:3417:: with SMTP id b23mr19512350yba.97.1604312287536; 
 Mon, 02 Nov 2020 02:18:07 -0800 (PST)
MIME-Version: 1.0
References: <20201027110446.20416-1-chrubis@suse.cz>
 <20201027110446.20416-3-chrubis@suse.cz>
In-Reply-To: <20201027110446.20416-3-chrubis@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Mon, 2 Nov 2020 18:17:55 +0800
Message-ID: <CAEemH2cOcAuoPcks4FPaTaS-THtjPvy+=uB3oGsnTSNp_umpMg@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] lib/tst_kconfig: Make use of boolean
 expression eval
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Cc: automated-testing@yoctoproject.org, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1451067060=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1451067060==
Content-Type: multipart/alternative; boundary="00000000000001fd5805b31d10a9"

--00000000000001fd5805b31d10a9
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 27, 2020 at 7:04 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Now each string in the kconfig[] array in tst_test structure is an
> boolean expression which is evaluated. All expressions has to be true in
> order for the test to continue.
>
> This also makes the parser for the kernel config a bit more robust as it
> was pointed out that there may have been cases where it could be mislead
> by hand edited config files.
>
> + Update the docs.
>
> Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> CC: Pengfei Xu <pengfei.xu@intel.com>
> ---
>
> v2:
>    - squashed the two patches since we are doing more extensive changes
>    - made the parser a bit more robust
>    - renamed a few fucntions and identifiers to make the code easier to
>      understand
>    - sprinkled the code with consts
>
>  doc/test-writing-guidelines.txt |  21 +-
>  include/tst_kconfig.h           |  34 +--
>  lib/newlib_tests/config06       |   1 +
>  lib/newlib_tests/test_kconfig.c |   1 +
>  lib/tst_kconfig.c               | 362 +++++++++++++++++++++-----------
>  5 files changed, 270 insertions(+), 149 deletions(-)
>  create mode 100644 lib/newlib_tests/config06
>
> diff --git a/doc/test-writing-guidelines.txt
> b/doc/test-writing-guidelines.txt
> index 1a51ef7c7..3c2ab7166 100644
> --- a/doc/test-writing-guidelines.txt
> +++ b/doc/test-writing-guidelines.txt
> @@ -1643,21 +1643,26 @@ on the system, disabled syscalls can be detected
> by checking for 'ENOSYS'
>  errno etc.
>
>  However in rare cases core kernel features couldn't be detected based on
> the
> -kernel userspace API and we have to resort to kernel .config parsing.
> +kernel userspace API and we have to resort to parse the kernel .config.
>
> -For this cases the test should set the 'NULL' terminated
> '.needs_kconfigs' array
> -of kernel config options required for the test. The config option can be
> -specified either as plain "CONFIG_FOO" in which case it's sufficient for
> the
> -test continue if it's set to any value (typically =y or =m). Or with a
> value
> -as "CONFIG_FOO=bar" in which case the value has to match as well. The
> test is
> -aborted with 'TCONF' if any of the required options were not set.
> +For this cases the test should set the 'NULL' terminated '.needs_kconfigs'
> +array of boolean expressions with constraints on the kconfig variables.
> The
> +boolean expression consits of variables, two binary operations '&' and
> '|',
> +negation '!' and correct sequence of parentesis '()'. Variables are
> expected
> +to be in a form of "CONFIG_FOO[=bar]".
> +
> +The test will continue to run if all expressions are evaluated to 'True'.
> +Missing variable is mapped to 'False' as well as variable with different
> than
> +specified value, e.g. 'CONFIG_FOO=bar' will evaluate to 'False' if the
> value
> +is anything else but 'bar'. If config variable is specified as plain
> +'CONFIG_FOO' it's evaluated to true it's set to any value (typically =y
> or =m).
>
>  [source,c]
>
>  -------------------------------------------------------------------------------
>  #include "tst_test.h"
>
>  static const char *kconfigs[] = {
> -       "CONFIG_X86_INTEL_UMIP",
> +       "CONFIG_X86_INTEL_UMIP | CONFIG_X86_UMIP",
>         NULL
>  };
>
> diff --git a/include/tst_kconfig.h b/include/tst_kconfig.h
> index 2d2cfd782..1bb21fea8 100644
> --- a/include/tst_kconfig.h
> +++ b/include/tst_kconfig.h
> @@ -6,27 +6,27 @@
>  #ifndef TST_KCONFIG_H__
>  #define TST_KCONFIG_H__
>
> -struct tst_kconfig_res {
> -       char match;
> -       char *value;
> +struct tst_kconfig_var {
> +       char id[64];
> +       unsigned int id_len;
> +       char choice;
> +       char *val;
>  };
>
>  /**
> - * Reads a kernel config and parses it for values defined in kconfigs
> array.
> + *
> + * Reads a kernel config, parses it and writes results into an array of
> + * tst_kconfig_var structures.
>   *
>   * The path to the kernel config should be autodetected in most of the
> cases as
>   * the code looks for know locations. It can be explicitely set/overrided
> with
>   * the KCONFIG_PATH environment variable as well.
>   *
> - * The kcofings array is expected to contain strings in a format
> "CONFIG_FOO"
> - * or "CONFIG_FOO=bar". The result array has to be suitably sized to fit
> the
> - * results.
> - *
> - * @param kconfigs array of config strings to look for
> - * @param results array to store results to
> - * @param cnt size of the arrays
> + * The caller has to initialize the tst_kconfig_var structure. The id has
> to be
> + * filled with config variable name such as 'CONFIG_FOO', the id_len
> should
> + * hold the id string length and the choice and val has to be zeroed.
>   *
> - * The match in the tst_kconfig_res structure is set as follows:
> + * After a call to this function each choice be set as follows:
>   *
>   *  'm' - config option set to m
>   *  'y' - config option set to y
> @@ -34,11 +34,13 @@ struct tst_kconfig_res {
>   *  'n' - config option is not set
>   *   0  - config option not found
>   *
> - * In the case that match is set to 'v' the value points to a newly
> allocated
> - * string that holds the value.
> + * In the case that match is set to 'v' the val pointer points to a newly
> + * allocated string that holds the value.
> + *
> + * @param vars An array of caller initalized tst_kconfig_var structures.
> + * @param vars_len Length of the vars array.
>   */
> -void tst_kconfig_read(const char *const kconfigs[],
> -                     struct tst_kconfig_res results[], size_t cnt);
> +void tst_kconfig_read(struct tst_kconfig_var vars[], size_t vars_len);
>
>  /**
>   * Checks if required kernel configuration options are set in the kernel
> diff --git a/lib/newlib_tests/config06 b/lib/newlib_tests/config06
> new file mode 100644
> index 000000000..b7db25411
> --- /dev/null
> +++ b/lib/newlib_tests/config06
> @@ -0,0 +1 @@
> +# Empty
> diff --git a/lib/newlib_tests/test_kconfig.c
> b/lib/newlib_tests/test_kconfig.c
> index d9c662fc5..183d55611 100644
> --- a/lib/newlib_tests/test_kconfig.c
> +++ b/lib/newlib_tests/test_kconfig.c
> @@ -14,6 +14,7 @@ static const char *kconfigs[] = {
>         "CONFIG_MMU",
>         "CONFIG_EXT4_FS=m",
>         "CONFIG_PGTABLE_LEVELS=4",
> +       "CONFIG_MMU & CONFIG_EXT4_FS=m",
>

The patchset looks awesome.

But a tiny issue was found from my test, the tst_kconfig_check() would be
failed to parse expression if reverse the sequence of the above string.

i.e.
-       "CONFIG_MMU & CONFIG_EXT4_FS=m",
+       "CONFIG_EXT4_FS=m & CONFIG_MMU",
(Core dumped here)

But trying with =Num, it gets different errors:

"CONFIG_MMU & CONFIG_PGTABLE_LEVELS=4",
(works well)

"CONFIG_PGTABLE_LEVELS=4 & CONFIG_MMU",
(print Expression not satisfied!)

-- 
Regards,
Li Wang

--00000000000001fd5805b31d10a9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Oct 27, 2020 at 7:04 PM Cyril Hrubis &lt;<a=
 href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Now each string in the kcon=
fig[] array in tst_test structure is an<br>
boolean expression which is evaluated. All expressions has to be true in<br=
>
order for the test to continue.<br>
<br>
This also makes the parser for the kernel config a bit more robust as it<br=
>
was pointed out that there may have been cases where it could be mislead<br=
>
by hand edited config files.<br>
<br>
+ Update the docs.<br>
<br>
Signed-off-by: Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz" target=
=3D"_blank">chrubis@suse.cz</a>&gt;<br>
CC: Pengfei Xu &lt;<a href=3D"mailto:pengfei.xu@intel.com" target=3D"_blank=
">pengfei.xu@intel.com</a>&gt;<br>
---<br>
<br>
v2:<br>
=C2=A0 =C2=A0- squashed the two patches since we are doing more extensive c=
hanges<br>
=C2=A0 =C2=A0- made the parser a bit more robust<br>
=C2=A0 =C2=A0- renamed a few fucntions and identifiers to make the code eas=
ier to<br>
=C2=A0 =C2=A0 =C2=A0understand<br>
=C2=A0 =C2=A0- sprinkled the code with consts<br>
<br>
=C2=A0doc/test-writing-guidelines.txt |=C2=A0 21 +-<br>
=C2=A0include/tst_kconfig.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0=
 34 +--<br>
=C2=A0lib/newlib_tests/config06=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +=
<br>
=C2=A0lib/newlib_tests/test_kconfig.c |=C2=A0 =C2=A01 +<br>
=C2=A0lib/tst_kconfig.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 362 +++++++++++++++++++++-----------<br>
=C2=A05 files changed, 270 insertions(+), 149 deletions(-)<br>
=C2=A0create mode 100644 lib/newlib_tests/config06<br>
<br>
diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.=
txt<br>
index 1a51ef7c7..3c2ab7166 100644<br>
--- a/doc/test-writing-guidelines.txt<br>
+++ b/doc/test-writing-guidelines.txt<br>
@@ -1643,21 +1643,26 @@ on the system, disabled syscalls can be detected by=
 checking for &#39;ENOSYS&#39;<br>
=C2=A0errno etc.<br>
<br>
=C2=A0However in rare cases core kernel features couldn&#39;t be detected b=
ased on the<br>
-kernel userspace API and we have to resort to kernel .config parsing.<br>
+kernel userspace API and we have to resort to parse the kernel .config.<br=
>
<br>
-For this cases the test should set the &#39;NULL&#39; terminated &#39;.nee=
ds_kconfigs&#39; array<br>
-of kernel config options required for the test. The config option can be<b=
r>
-specified either as plain &quot;CONFIG_FOO&quot; in which case it&#39;s su=
fficient for the<br>
-test continue if it&#39;s set to any value (typically =3Dy or =3Dm). Or wi=
th a value<br>
-as &quot;CONFIG_FOO=3Dbar&quot; in which case the value has to match as we=
ll. The test is<br>
-aborted with &#39;TCONF&#39; if any of the required options were not set.<=
br>
+For this cases the test should set the &#39;NULL&#39; terminated &#39;.nee=
ds_kconfigs&#39;<br>
+array of boolean expressions with constraints on the kconfig variables. Th=
e<br>
+boolean expression consits of variables, two binary operations &#39;&amp;&=
#39; and &#39;|&#39;,<br>
+negation &#39;!&#39; and correct sequence of parentesis &#39;()&#39;. Vari=
ables are expected<br>
+to be in a form of &quot;CONFIG_FOO[=3Dbar]&quot;.<br>
+<br>
+The test will continue to run if all expressions are evaluated to &#39;Tru=
e&#39;.<br>
+Missing variable is mapped to &#39;False&#39; as well as variable with dif=
ferent than<br>
+specified value, e.g. &#39;CONFIG_FOO=3Dbar&#39; will evaluate to &#39;Fal=
se&#39; if the value<br>
+is anything else but &#39;bar&#39;. If config variable is specified as pla=
in<br>
+&#39;CONFIG_FOO&#39; it&#39;s evaluated to true it&#39;s set to any value =
(typically =3Dy or =3Dm).<br>
<br>
=C2=A0[source,c]<br>
=C2=A0---------------------------------------------------------------------=
----------<br>
=C2=A0#include &quot;tst_test.h&quot;<br>
<br>
=C2=A0static const char *kconfigs[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;CONFIG_X86_INTEL_UMIP&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;CONFIG_X86_INTEL_UMIP | CONFIG_X86_UMIP&q=
uot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL<br>
=C2=A0};<br>
<br>
diff --git a/include/tst_kconfig.h b/include/tst_kconfig.h<br>
index 2d2cfd782..1bb21fea8 100644<br>
--- a/include/tst_kconfig.h<br>
+++ b/include/tst_kconfig.h<br>
@@ -6,27 +6,27 @@<br>
=C2=A0#ifndef TST_KCONFIG_H__<br>
=C2=A0#define TST_KCONFIG_H__<br>
<br>
-struct tst_kconfig_res {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0char match;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0char *value;<br>
+struct tst_kconfig_var {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char id[64];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int id_len;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char choice;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char *val;<br>
=C2=A0};<br>
<br>
=C2=A0/**<br>
- * Reads a kernel config and parses it for values defined in kconfigs arra=
y.<br>
+ *<br>
+ * Reads a kernel config, parses it and writes results into an array of<br=
>
+ * tst_kconfig_var structures.<br>
=C2=A0 *<br>
=C2=A0 * The path to the kernel config should be autodetected in most of th=
e cases as<br>
=C2=A0 * the code looks for know locations. It can be explicitely set/overr=
ided with<br>
=C2=A0 * the KCONFIG_PATH environment variable as well.<br>
=C2=A0 *<br>
- * The kcofings array is expected to contain strings in a format &quot;CON=
FIG_FOO&quot;<br>
- * or &quot;CONFIG_FOO=3Dbar&quot;. The result array has to be suitably si=
zed to fit the<br>
- * results.<br>
- *<br>
- * @param kconfigs array of config strings to look for<br>
- * @param results array to store results to<br>
- * @param cnt size of the arrays<br>
+ * The caller has to initialize the tst_kconfig_var structure. The id has =
to be<br>
+ * filled with config variable name such as &#39;CONFIG_FOO&#39;, the id_l=
en should<br>
+ * hold the id string length and the choice and val has to be zeroed.<br>
=C2=A0 *<br>
- * The match in the tst_kconfig_res structure is set as follows:<br>
+ * After a call to this function each choice be set as follows:<br>
=C2=A0 *<br>
=C2=A0 *=C2=A0 &#39;m&#39; - config option set to m<br>
=C2=A0 *=C2=A0 &#39;y&#39; - config option set to y<br>
@@ -34,11 +34,13 @@ struct tst_kconfig_res {<br>
=C2=A0 *=C2=A0 &#39;n&#39; - config option is not set<br>
=C2=A0 *=C2=A0 =C2=A00=C2=A0 - config option not found<br>
=C2=A0 *<br>
- * In the case that match is set to &#39;v&#39; the value points to a newl=
y allocated<br>
- * string that holds the value.<br>
+ * In the case that match is set to &#39;v&#39; the val pointer points to =
a newly<br>
+ * allocated string that holds the value.<br>
+ *<br>
+ * @param vars An array of caller initalized tst_kconfig_var structures.<b=
r>
+ * @param vars_len Length of the vars array.<br>
=C2=A0 */<br>
-void tst_kconfig_read(const char *const kconfigs[],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0struct tst_kconfig_res results[], size_t cnt);<br>
+void tst_kconfig_read(struct tst_kconfig_var vars[], size_t vars_len);<br>
<br>
=C2=A0/**<br>
=C2=A0 * Checks if required kernel configuration options are set in the ker=
nel<br>
diff --git a/lib/newlib_tests/config06 b/lib/newlib_tests/config06<br>
new file mode 100644<br>
index 000000000..b7db25411<br>
--- /dev/null<br>
+++ b/lib/newlib_tests/config06<br>
@@ -0,0 +1 @@<br>
+# Empty<br>
diff --git a/lib/newlib_tests/test_kconfig.c b/lib/newlib_tests/test_kconfi=
g.c<br>
index d9c662fc5..183d55611 100644<br>
--- a/lib/newlib_tests/test_kconfig.c<br>
+++ b/lib/newlib_tests/test_kconfig.c<br>
@@ -14,6 +14,7 @@ static const char *kconfigs[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;CONFIG_MMU&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;CONFIG_EXT4_FS=3Dm&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;CONFIG_PGTABLE_LEVELS=3D4&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;CONFIG_MMU &amp; CONFIG_EXT4_FS=3Dm&quot;=
,<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D=
"font-size:small">The patchset looks awesome.</div><div class=3D"gmail_defa=
ult" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">But a tiny issue was found from my test, the tst_kconf=
ig_check() would be</div><div class=3D"gmail_default" style=3D"font-size:sm=
all">failed to parse expression=C2=A0if reverse the sequence of the above s=
tring.</div></div><div class=3D"gmail_default" style=3D"font-size:small"><b=
r></div><div class=3D"gmail_default" style=3D"font-size:small">i.e.=C2=A0</=
div><div class=3D"gmail_default" style=3D"font-size:small">- =C2=A0 =C2=A0 =
=C2=A0 &quot;CONFIG_MMU &amp; CONFIG_EXT4_FS=3Dm&quot;,<br>+ =C2=A0 =C2=A0 =
=C2=A0 &quot;CONFIG_EXT4_FS=3Dm &amp; CONFIG_MMU&quot;,</div></div><div><di=
v class=3D"gmail_default" style=3D"font-size:small">(Core dumped here)</div=
><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div clas=
s=3D"gmail_default" style=3D"font-size:small">But trying with =3DNum, it ge=
ts different errors:</div><div class=3D"gmail_default" style=3D"font-size:s=
mall"><br></div><div class=3D"gmail_default" style=3D"font-size:small">&quo=
t;CONFIG_MMU &amp; CONFIG_PGTABLE_LEVELS=3D4&quot;,</div><div class=3D"gmai=
l_default" style=3D"font-size:small">(works well)</div><div class=3D"gmail_=
default" style=3D"font-size:small"><br></div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">&quot;CONFIG_PGTABLE_LEVELS=3D4 &amp; CONFIG_MMU&q=
uot;,</div><div class=3D"gmail_default" style=3D"font-size:small">(print Ex=
pression not satisfied!)</div></div><div><br></div>-- <br><div dir=3D"ltr" =
class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li W=
ang<br></div></div></div></div>

--00000000000001fd5805b31d10a9--


--===============1451067060==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1451067060==--

