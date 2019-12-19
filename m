Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE01125E67
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Dec 2019 10:59:38 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 90DBB3C2241
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Dec 2019 10:59:38 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 588613C17C7
 for <ltp@lists.linux.it>; Thu, 19 Dec 2019 10:59:36 +0100 (CET)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C76172016CA
 for <ltp@lists.linux.it>; Thu, 19 Dec 2019 10:59:34 +0100 (CET)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Dec 2019 01:59:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,331,1571727600"; d="scan'208";a="222233388"
Received: from xpf-desktop.sh.intel.com (HELO xpf-desktop) ([10.239.13.102])
 by fmsmga001.fm.intel.com with ESMTP; 19 Dec 2019 01:59:31 -0800
Date: Thu, 19 Dec 2019 18:06:02 +0800
From: Pengfei Xu <pengfei.xu@intel.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20191219100602.mpyelysyizonfrit@xpf-desktop>
References: <20191218122504.9985-1-pengfei.xu@intel.com>
 <c97da094-a320-e4b4-dee9-423a3e306ecf@cn.fujitsu.com>
 <b19e2cd0-964f-2fe3-860f-039d63088d52@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b19e2cd0-964f-2fe3-860f-039d63088d52@cn.fujitsu.com>
User-Agent: NeoMutt/20170609 (1.8.3)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] lib/tst_kconfig.c: add or select kconfig
 function
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
Cc: Su Heng <heng.su@intel.com>, Neri Ricardo <ricardo.neri@intel.com>,
 ltp <ltp@lists.linux.it>, Kasten Robert <robert.a.kasten@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Xu,
  Thanks for your advice!
  My concern is that:
  If some one need any CONFIG_A, CONFIG_B, CONFIG_C ... set to y.
  We need rewrite again.
  Also, thanks for advice, I will used newlib_tests to double check. :)

  Thanks!
  BR.

On 2019-12-19 at 17:05:00 +0800, Yang Xu wrote:
> Hi Pengfei
> =

> on 2019/12/19 12:02, Yang Xu wrote:
> > Hi Pengfei
> > =

> > on 2019/12/18 20:25, Pengfei Xu wrote:
> > > Add "or" select kconfig function:
> > > =A0=A0 For example, umip kconfig changed from "CONFIG_X86_INTEL_UMIP=
=3Dy"
> > > to "CONFIG_X86_UMIP=3Dy": as before v5.4 mainline kernel used
> > > kconfig "CONFIG_X86_INTEL_UMIP=3Dy", after v5.5 mainline kernel would=
 use
> > > "CONFIG_X86_UMIP=3Dy".
> > > =A0=A0 We could fill "CONFIG_X86_INTEL_UMIP|CONFIG_X86_UMIP=3Dy" in
> > > needs_kconfigs
> > > to check umip kconfig item, which actually is the same item.
> > > =

> Or, we can only modify match funtion to make it possibile. What do you th=
ink
> about it?
> The way as bleow:
> 1. detect whether has "|"
> 2. strncmp system kconfig  with our first kconfig(CONFIG_X86_INTEL_UMIP),=
 if
> not ,compare with the second kconfig(CONFIG_X86_UMIP)
> =

> diff --git a/lib/tst_kconfig.c b/lib/tst_kconfig.c
> index 4b51413e5..cb9ee46bf 100644
> --- a/lib/tst_kconfig.c
> +++ b/lib/tst_kconfig.c
> @@ -117,20 +117,41 @@ static int is_set(const char *str, const char *val)
>  static inline int match(struct match *match, const char *conf,
>                          struct tst_kconfig_res *result, const char *line)
>  {
> +       int len, len1 =3D 0;
>         if (match->match)
>                 return 0;
> -
> +       len1 =3D match->len;
>         const char *cfg =3D strstr(line, "CONFIG_");
> =

>         if (!cfg)
>                 return 0;
> =

> -       if (strncmp(cfg, conf, match->len))
> -               return 0;
> -
> -       const char *val =3D &cfg[match->len];
> -
> -       switch (cfg[match->len]) {
> +       const char * val1 =3D strchr(conf, '|');
> +       if (!val1) {
> +               if (strncmp(cfg, conf, match->len))
> +                       return 0;
> +       } else {
> +               const char *val3 =3D strchr(val1, '=3D');
> +               const char *val2 =3D strstr(val1, "CONFIG_");
> +               if (!val2) {
> +                       tst_brk(TBROK, "Invalid config string '%s'", val1=
);
> +                       return 0;
> +               }
> +               if(!val3)
> +                       len =3D strlen(val2);
> +               else
> +                       len =3D strlen(val2)-strlen(val3);
> +
> +               if (strncmp(cfg, conf, match->len - (len+1))) {
> +                       if (strncmp(cfg, val2, len)) {
> +                               return 0;
> +                       }
> +                       len1 =3D len;
> +               } else
> +                       len1 =3D  match->len - len -1;
> +       }
> +       const char *val =3D &cfg[len1];
> +       switch (cfg[len1]) {
> =

> =

> Kind Regards
> Yang Xu
> > > Signed-off-by: Pengfei Xu <pengfei.xu@intel.com>
> > > ---
> > > =A0 lib/tst_kconfig.c | 43 +++++++++++++++++++++++++++----------------
> > > =A0 1 file changed, 27 insertions(+), 16 deletions(-)
> > > =

> > > diff --git a/lib/tst_kconfig.c b/lib/tst_kconfig.c
> > > index 4b51413e5..91c0a821b 100644
> > > --- a/lib/tst_kconfig.c
> > > +++ b/lib/tst_kconfig.c
> > > @@ -167,7 +167,12 @@ void tst_kconfig_read(const char *const *kconfig=
s,
> > > =A0=A0=A0=A0=A0 struct match matches[cnt];
> > > =A0=A0=A0=A0=A0 FILE *fp;
> > > =A0=A0=A0=A0=A0 unsigned int i, j;
> > > -=A0=A0=A0 char buf[1024];
> > > +=A0=A0=A0 char buf[1024], kconfig_multi[100];
> > > +=A0=A0=A0 char *kconfig_token =3D NULL, *p_left =3D NULL;
> > > +
> > > +=A0=A0=A0 fp =3D open_kconfig();
> > > +=A0=A0=A0 if (!fp)
> > > +=A0=A0=A0=A0=A0=A0=A0 tst_brk(TBROK, "Cannot parse kernel .config");
> > > =A0=A0=A0=A0=A0 for (i =3D 0; i < cnt; i++) {
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 const char *val =3D strchr(kconfigs[i], '=
=3D');
> > > @@ -178,32 +183,38 @@ void tst_kconfig_read(const char *const *kconfi=
gs,
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 matches[i].match =3D 0;
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 matches[i].len =3D strlen(kconfigs[i]);
> > > -=A0=A0=A0=A0=A0=A0=A0 if (val) {
> > > +=A0=A0=A0=A0=A0=A0=A0 if (val)
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 matches[i].val =3D val + 1;
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 matches[i].len -=3D strlen(val);
> > > -=A0=A0=A0=A0=A0=A0=A0 }
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 results[i].match =3D 0;
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 results[i].value =3D NULL;
> > > -=A0=A0=A0 }
> > > -=A0=A0=A0 fp =3D open_kconfig();
> > > -=A0=A0=A0 if (!fp)
> > > -=A0=A0=A0=A0=A0=A0=A0 tst_brk(TBROK, "Cannot parse kernel .config");
> > > +=A0=A0=A0=A0=A0=A0=A0 while (fgets(buf, sizeof(buf), fp)) {
> > > -=A0=A0=A0 while (fgets(buf, sizeof(buf), fp)) {
> > > -=A0=A0=A0=A0=A0=A0=A0 for (i =3D 0; i < cnt; i++) {
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (match(&matches[i], kconfigs[i]=
, &results[i], buf)) {
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 for (j =3D 0; j < cnt;=
 j++) {
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (matche=
s[j].match)
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 break;
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 memset(kconfig_multi, 0, sizeof(kc=
onfig_multi));
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* strtok_r will split kconfigs[i]=
 to multi string, so
> > > copy it */
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 memcpy(kconfig_multi, kconfigs[i],=
 strlen(kconfigs[i]));
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 kconfig_token =3D strtok_r(kconfig=
_multi, "|=3D", &p_left)
> > Here has a problem, if we use CONFIG_X86_INTEL_UMIP, it will report
> > "miss this config" because it uses "=3D" or "|" to delim string.
> > And I think you should use lib/newlib_tests/test_kconfig.c to test your
> > introduced feature.
> > =

> > Also, it has another two problems even we use "|" or "=3D" in kconfigs
> > =

> > 1.If=A0 use "CONFIG_X86_INTEL_UMIP=3Dy|CONFIG_X86_UMIP=3Dy" ,it will re=
port y
> > is invalid because we use "=3D"or "|" to delim string.
> > 2. If=A0 use "CONFIG_X86_INTEL_UMIP|X86_INTEL_UMIP=3Dy", it will doesn't
> > check second config whether invalid if the first is ok.
> > =

> > Kind Regards
> > Yang Xu
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 while (kconfig_token !=3D NULL) {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (strncmp("CONFIG_",=
 kconfig_token, 7))
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 tst_brk(TB=
ROK, "Invalid config string '%s'",
> > > kconfig_token);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 matches[i].len =3D str=
len(kconfig_token);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (match(&matches[i],=
 kconfig_token, &results[i],
> > > buf)) {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 for (j =3D=
 0; j < cnt; j++) {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 if (matches[j].match)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 break;
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (j =3D=3D cnt)
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto =
exit;
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 kconfig_token =3D strt=
ok_r(NULL, "|=3D", &p_left);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* avoid to use after =
"=3D" string */
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (strlen(p_left) =3D=
=3D 0)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> > > -
> > > =A0=A0=A0=A0=A0 }
> > > =A0 exit:
> > > =

> > =

> > =

> > =

> =

> =


-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
