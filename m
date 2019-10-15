Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 94418D6E7A
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Oct 2019 07:12:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 242CC3C22D4
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Oct 2019 07:12:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 8C7E53C2208
 for <ltp@lists.linux.it>; Tue, 15 Oct 2019 07:12:52 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 46B191401175
 for <ltp@lists.linux.it>; Tue, 15 Oct 2019 07:12:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571116368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5mVXDbnr8V8V0KOrbPlD653wmsMiJZjLNqetKWPdNIM=;
 b=SXm5hbVAMHPOpdT79+11gyRstn+tYsc70ZbtkgJoxzRh1scJZWBklpSY3PaFWQaZedCmxs
 EQyY+oqYXQfBxPaSaj+yhkHsrs2OL24TnrQy5y9yN86VVcqTqwlBmCT2Bt5Kj0KqpePeU+
 mbKQfpoLa0NUJaIUv5Z9Cj03JCf23jQ=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-6tYdJAZnOZ2G61c96CBTCw-1; Tue, 15 Oct 2019 01:12:46 -0400
Received: by mail-oi1-f198.google.com with SMTP id c190so10970442oig.9
 for <ltp@lists.linux.it>; Mon, 14 Oct 2019 22:12:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mMg6cppBlf/o0KV+7ghzLoDHZskfjdUnuDwcy4xfk8I=;
 b=XciYmzBjaaPiWb0ucMMQu36Vb/pSaovqRwJdKnsHSK3WvRHCa5fia1xf7oNgMqCFDd
 qrm/xKC4bYnOi64gg8jGp1KCVNkNrdGMjJtEfXrvMROmajdyAe3rmMrAXKvVEeb7Cmdq
 K3RmBfip90EKBNSvZLO+1TKAnGDdZJMQLvjEMm1oaeGPZ65EqYD7hp5QX66KH1mJ0TYN
 8pXdLI45X4p0MaOxJhkYj52+pgQ0pEjHIbcwoiyaDnEgYgZCD/Qn5g5hAWztXNwWMBLL
 EhgSdnLfmkDa9Ej3j8otTAcSPe/rNS/1OoZ3cvtLZJAt3L5P66aMVuyzc5picVK0G/Dm
 O7vQ==
X-Gm-Message-State: APjAAAXonS0G4Pu/bOjXYzauDYgQADH8wLHsQy87dH5kaj516r52mTA+
 HkXXIFh1RTFtnIqysLe54HcRX5kwnjE8wKVWjusismJ02oZRwk6oWWhCzm+HirwPHWZ08UbJYs7
 joZi7kF02yx8ncd+C80KBREe9sFk=
X-Received: by 2002:a9d:5907:: with SMTP id t7mr17529596oth.118.1571116365508; 
 Mon, 14 Oct 2019 22:12:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxf31rqzN9rnngXZwQxamMCZEI5K3/xrClY8m/NqvuyUdxD5dBn/fy+1OXMKs7gIDBGsXJgbG3UN2X4r9YLq5w=
X-Received: by 2002:a9d:5907:: with SMTP id t7mr17529590oth.118.1571116365266; 
 Mon, 14 Oct 2019 22:12:45 -0700 (PDT)
MIME-Version: 1.0
References: <20191014112522.24548-1-chrubis@suse.cz>
 <20191014112522.24548-2-chrubis@suse.cz>
In-Reply-To: <20191014112522.24548-2-chrubis@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Tue, 15 Oct 2019 13:12:34 +0800
Message-ID: <CAEemH2e+xD2OCFZs14ejmppKu2rLXKsr16Vfc3tqw-YoesWuJg@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-MC-Unique: 6tYdJAZnOZ2G61c96CBTCw-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] lib: Add support for test tags
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1899039398=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1899039398==
Content-Type: multipart/alternative; boundary="000000000000da5b080594ec0881"

--000000000000da5b080594ec0881
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2019 at 7:25 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> The newly introduced test tags are generic name-value pairs that can
> hold test metadata, the intended use for now is to store kernel commit
> hashes for kernel reproducers as well as CVE ids. The mechanism is
> however choosen to be very generic so that it's easy to add basically
> any information later on.
>
> As it is the main purpose is to print hints for a test failures. If a
> test that has been written as a kernel reproducer fails it prints nice
> URL pointing to a kernel commit that may be missing.
>

Nice to see this feature patchset achieved, it looks quite clear&good to
me. Just have some tiny comments below.

>
> Example output:
>
> -------------------------------------------------------------------------=
-
> tst_test.c:1145: INFO: Timeout per run is 0h 05m 00s
> add_key02.c:98: FAIL: unexpected error with key type 'asymmetric': EINVAL
> add_key02.c:98: FAIL: unexpected error with key type 'cifs.idmap': EINVAL
> add_key02.c:98: FAIL: unexpected error with key type 'cifs.spnego': EINVA=
L
> add_key02.c:98: FAIL: unexpected error with key type 'pkcs7_test': EINVAL
> add_key02.c:98: FAIL: unexpected error with key type 'rxrpc': EINVAL
> add_key02.c:98: FAIL: unexpected error with key type 'rxrpc_s': EINVAL
> add_key02.c:98: FAIL: unexpected error with key type 'user': EINVAL
> add_key02.c:98: FAIL: unexpected error with key type 'logon': EINVAL
>
> HINT: This is a regression test for linux kernel, see commit:
>
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D5649645d725c
>
> HINT: This test also tests for CVE-2017-15274, see:
>
> https://cve.mitre.org/cgi-bin/cvename.cgi?name=3DCVE-2017-15274
>
> Summary:
> passed   0
> failed   8
> skipped  0
> warnings 0
> -------------------------------------------------------------------------=
-
>
> Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> ---
>  include/tst_test.h | 10 ++++++
>  lib/tst_test.c     | 77 +++++++++++++++++++++++++++++++++++++++++-----
>  2 files changed, 80 insertions(+), 7 deletions(-)
>
> diff --git a/include/tst_test.h b/include/tst_test.h
> index 84acf2c59..4a51b6d16 100644
> --- a/include/tst_test.h
> +++ b/include/tst_test.h
> @@ -108,6 +108,11 @@ int tst_parse_int(const char *str, int *val, int min=
,
> int max);
>  int tst_parse_long(const char *str, long *val, long min, long max);
>  int tst_parse_float(const char *str, float *val, float min, float max);
>
> +struct tst_tag {
> +       const char *name;
> +       const char *value;
> +};
> +
>  extern unsigned int tst_variant;
>
>  struct tst_test {
> @@ -212,6 +217,11 @@ struct tst_test {
>          * NULL-terminated array of capability settings
>          */
>         struct tst_cap *caps;
> +
> +       /*
> +        * {NULL, NULL} terminated array of tags.
> +        */
> +       const struct tst_tag *tags;
>  };
>
>  /*
> diff --git a/lib/tst_test.c b/lib/tst_test.c
> index 6239acf89..2129f38cb 100644
> --- a/lib/tst_test.c
> +++ b/lib/tst_test.c
> @@ -31,6 +31,9 @@
>  #include "old_device.h"
>  #include "old_tmpdir.h"
>
> +#define LINUX_GIT_URL "
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D
> "
> +#define CVE_DB_URL "https://cve.mitre.org/cgi-bin/cvename.cgi?name=3DCVE=
-"
> +
>  struct tst_test *tst_test;
>
>  static const char *tid;
> @@ -414,6 +417,9 @@ static void print_help(void)
>  {
>         unsigned int i;
>
> +       fprintf(stderr, "Options\n");
> +       fprintf(stderr, "-------\n\n");
> +
>         for (i =3D 0; i < ARRAY_SIZE(options); i++)
>                 fprintf(stderr, "%s\n", options[i].help);
>
> @@ -424,6 +430,27 @@ static void print_help(void)
>                 fprintf(stderr, "%s\n", tst_test->options[i].help);
>  }
>
> +static void print_test_info(void)
>

print_test_info sounds like general information for the test, maybe
print_tags() is a better/precise name?

> +{
> +       unsigned int i;
> +       const struct tst_tag *tags =3D tst_test->tags;
> +
> +       printf("\nTags\n");
> +       printf("----\n\n");
> +
> +       if (tags) {
> +               for (i =3D 0; tags[i].name; i++) {
> +                       if (!strcmp(tags[i].name, "CVE"))
> +                               printf(CVE_DB_URL "%s\n", tags[i].value);
> +                       else if (!strcmp(tags[i].name, "linux-git"))
> +                               printf(LINUX_GIT_URL "%s\n",
> tags[i].value);
> +                       else
> +                               printf("%s: %s\n", tags[i].name,
> tags[i].value);
> +                       printf("\n");
> +               }
> +       }
> +}
> +
>  static void check_option_collision(void)
>  {
>         unsigned int i, j;
> @@ -499,6 +526,7 @@ static void parse_opts(int argc, char *argv[])
>                 break;
>                 case 'h':
>                         print_help();
> +                       print_test_info();
>                         exit(0);
>                 case 'i':
>                         iterations =3D atoi(optarg);
> @@ -584,26 +612,61 @@ int tst_parse_float(const char *str, float *val,
> float min, float max)
>         return 0;
>  }
>
> +static void print_colored(const char *str)
> +{
> +       if (tst_color_enabled(STDOUT_FILENO))
> +               printf("%s%s%s", ANSI_COLOR_YELLOW, str, ANSI_COLOR_RESET=
);
> +       else
> +               printf("%s", str);
> +}
> +
> +static void print_failure_hints(void)
> +{
> +       unsigned int i;
> +       const struct tst_tag *tags =3D tst_test->tags;
> +
> +       if (!tags)
> +               return;
> +
> +       for (i =3D 0; tags[i].name; i++) {
> +               if (!strcmp(tags[i].name, "linux-git")) {
> +                       printf("\n");
> +                       print_colored("HINT: ");

+                       printf("This is a regression test for linux kernel,
> see commit:\n\n"
> +                              LINUX_GIT_URL "%s\n", tags[i].value);
>

This sentence 'HINT: This is a ...' will be printed many times if there are
many commits in tags, I prefer to see only once in front of these
linux-kernel links.


> +               }
> +
> +               if (!strcmp(tags[i].name, "CVE")) {
> +                       printf("\n");
> +                       print_colored("HINT: ");
> +                       printf("This test also tests for CVE-%s, see:\n\n=
"
> +                              CVE_DB_URL "%s\n", tags[i].value,
> tags[i].value);
>

Here as well.

--=20
Regards,
Li Wang

--000000000000da5b080594ec0881
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Oct 14, 2019 at 7:25 PM Cyril Hrubis &lt;<a=
 href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">The newly introduced test t=
ags are generic name-value pairs that can<br>
hold test metadata, the intended use for now is to store kernel commit<br>
hashes for kernel reproducers as well as CVE ids. The mechanism is<br>
however choosen to be very generic so that it&#39;s easy to add basically<b=
r>
any information later on.<br>
<br>
As it is the main purpose is to print hints for a test failures. If a<br>
test that has been written as a kernel reproducer fails it prints nice<br>
URL pointing to a kernel commit that may be missing.<br></blockquote><div><=
br></div><div class=3D"gmail_default" style=3D"font-size:small">Nice to see=
 this feature patchset achieved, it looks quite clear&amp;good to me. Just =
have some tiny comments below.</div><div class=3D"gmail_default" style=3D"f=
ont-size:small"></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Example output:<br>
<br>
--------------------------------------------------------------------------<=
br>
tst_test.c:1145: INFO: Timeout per run is 0h 05m 00s<br>
add_key02.c:98: FAIL: unexpected error with key type &#39;asymmetric&#39;: =
EINVAL<br>
add_key02.c:98: FAIL: unexpected error with key type &#39;cifs.idmap&#39;: =
EINVAL<br>
add_key02.c:98: FAIL: unexpected error with key type &#39;cifs.spnego&#39;:=
 EINVAL<br>
add_key02.c:98: FAIL: unexpected error with key type &#39;pkcs7_test&#39;: =
EINVAL<br>
add_key02.c:98: FAIL: unexpected error with key type &#39;rxrpc&#39;: EINVA=
L<br>
add_key02.c:98: FAIL: unexpected error with key type &#39;rxrpc_s&#39;: EIN=
VAL<br>
add_key02.c:98: FAIL: unexpected error with key type &#39;user&#39;: EINVAL=
<br>
add_key02.c:98: FAIL: unexpected error with key type &#39;logon&#39;: EINVA=
L<br>
<br>
HINT: This is a regression test for linux kernel, see commit:<br>
<br>
<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it/commit/?id=3D5649645d725c" rel=3D"noreferrer" target=3D"_blank">https://=
git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3D564=
9645d725c</a><br>
<br>
HINT: This test also tests for CVE-2017-15274, see:<br>
<br>
<a href=3D"https://cve.mitre.org/cgi-bin/cvename.cgi?name=3DCVE-2017-15274"=
 rel=3D"noreferrer" target=3D"_blank">https://cve.mitre.org/cgi-bin/cvename=
.cgi?name=3DCVE-2017-15274</a><br>
<br>
Summary:<br>
passed=C2=A0 =C2=A00<br>
failed=C2=A0 =C2=A08<br>
skipped=C2=A0 0<br>
warnings 0<br>
--------------------------------------------------------------------------<=
br>
<br>
Signed-off-by: Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz" target=
=3D"_blank">chrubis@suse.cz</a>&gt;<br>
---<br>
=C2=A0include/tst_test.h | 10 ++++++<br>
=C2=A0lib/tst_test.c=C2=A0 =C2=A0 =C2=A0| 77 ++++++++++++++++++++++++++++++=
+++++++++++-----<br>
=C2=A02 files changed, 80 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/include/tst_test.h b/include/tst_test.h<br>
index 84acf2c59..4a51b6d16 100644<br>
--- a/include/tst_test.h<br>
+++ b/include/tst_test.h<br>
@@ -108,6 +108,11 @@ int tst_parse_int(const char *str, int *val, int min, =
int max);<br>
=C2=A0int tst_parse_long(const char *str, long *val, long min, long max);<b=
r>
=C2=A0int tst_parse_float(const char *str, float *val, float min, float max=
);<br>
<br>
+struct tst_tag {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *name;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *value;<br>
+};<br>
+<br>
=C2=A0extern unsigned int tst_variant;<br>
<br>
=C2=A0struct tst_test {<br>
@@ -212,6 +217,11 @@ struct tst_test {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* NULL-terminated array of capability set=
tings<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct tst_cap *caps;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * {NULL, NULL} terminated array of tags.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct tst_tag *tags;<br>
=C2=A0};<br>
<br>
=C2=A0/*<br>
diff --git a/lib/tst_test.c b/lib/tst_test.c<br>
index 6239acf89..2129f38cb 100644<br>
--- a/lib/tst_test.c<br>
+++ b/lib/tst_test.c<br>
@@ -31,6 +31,9 @@<br>
=C2=A0#include &quot;old_device.h&quot;<br>
=C2=A0#include &quot;old_tmpdir.h&quot;<br>
<br>
+#define LINUX_GIT_URL &quot;<a href=3D"https://git.kernel.org/pub/scm/linu=
x/kernel/git/torvalds/linux.git/commit/?id=3D" rel=3D"noreferrer" target=3D=
"_blank">https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git=
/commit/?id=3D</a>&quot;<br>
+#define CVE_DB_URL &quot;<a href=3D"https://cve.mitre.org/cgi-bin/cvename.=
cgi?name=3DCVE-" rel=3D"noreferrer" target=3D"_blank">https://cve.mitre.org=
/cgi-bin/cvename.cgi?name=3DCVE-</a>&quot;<br>
+<br>
=C2=A0struct tst_test *tst_test;<br>
<br>
=C2=A0static const char *tid;<br>
@@ -414,6 +417,9 @@ static void print_help(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int i;<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;Options\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;-------\n\n&quot;);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; ARRAY_SIZE(options); i++)<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &qu=
ot;%s\n&quot;, options[i].help);<br>
<br>
@@ -424,6 +430,27 @@ static void print_help(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &qu=
ot;%s\n&quot;, tst_test-&gt;options[i].help);<br>
=C2=A0}<br>
<br>
+static void print_test_info(void)<br></blockquote><div><br></div><div clas=
s=3D"gmail_default" style=3D"font-size:small">print_test_info sounds like g=
eneral information for the test, maybe print_tags() is a better/precise nam=
e?</div><div class=3D"gmail_default" style=3D"font-size:small"></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int i;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct tst_tag *tags =3D tst_test-&gt;tag=
s;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;\nTags\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;----\n\n&quot;);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (tags) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; tags[=
i].name; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (!strcmp(tags[i].name, &quot;CVE&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf(CVE_DB_URL &quot;%s\n&quot;, t=
ags[i].value);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0else if (!strcmp(tags[i].name, &quot;linux-git&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf(LINUX_GIT_URL &quot;%s\n&quot;=
, tags[i].value);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;%s: %s\n&quot;, tags[i].=
name, tags[i].value);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0printf(&quot;\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+}<br>
+<br>
=C2=A0static void check_option_collision(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int i, j;<br>
@@ -499,6 +526,7 @@ static void parse_opts(int argc, char *argv[])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case &#39;h&#39;:<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 print_help();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0print_test_info();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 exit(0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case &#39;i&#39;:<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 iterations =3D atoi(optarg);<br>
@@ -584,26 +612,61 @@ int tst_parse_float(const char *str, float *val, floa=
t min, float max)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
=C2=A0}<br>
<br>
+static void print_colored(const char *str)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (tst_color_enabled(STDOUT_FILENO))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;%s%s%s=
&quot;, ANSI_COLOR_YELLOW, str, ANSI_COLOR_RESET);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;%s&quo=
t;, str);<br>
+}<br>
+<br>
+static void print_failure_hints(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int i;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct tst_tag *tags =3D tst_test-&gt;tag=
s;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!tags)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; tags[i].name; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!strcmp(tags[i]=
.name, &quot;linux-git&quot;)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0printf(&quot;\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0print_colored(&quot;HINT: &quot;);</blockquote><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0printf(&quot;This is a regression test for linux kernel, see comm=
it:\n\n&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LINUX_GIT_URL &quot;%s\n&quot;, tags[i].val=
ue);<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=
=3D"font-size:small">This sentence &#39;HINT: This is a ...&#39; will be pr=
inted many times if there are many commits in tags, I prefer to see only on=
ce in front of these linux-kernel links.</div></div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!strcmp(tags[i]=
.name, &quot;CVE&quot;)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0printf(&quot;\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0print_colored(&quot;HINT: &quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0printf(&quot;This test also tests for CVE-%s, see:\n\n&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CVE_DB_URL &quot;%s\n&quot;, tags[i].value,=
 tags[i].value);<br></blockquote><div><br></div><div><div class=3D"gmail_de=
fault" style=3D"font-size:small">Here as well.</div></div><div><br></div></=
div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div=
>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000da5b080594ec0881--


--===============1899039398==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1899039398==--

