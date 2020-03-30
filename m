Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B1C197C6E
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 15:07:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2A52F3C3158
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 15:07:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id D45633C181C
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 15:07:52 +0200 (CEST)
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 2ACEB1400048
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 15:07:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585573670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1LqbvZCmnXp0ywfaHV4vqZ51fMK/5TjBAQMXVLSAK7U=;
 b=NHw1Qdch2H93SBnvPMXVPZT5KnONJ/zrd5zD5GMEunsnSM38YXhpxLJtUEZWGNY6ltbKCY
 ZXNJ61XvTZqlaVOzxlU2LXHEoE7OExVATOVe7wE2SDD1Sk3tbRq4rS0moo1l4cN4nbMtUR
 aii26I+nkZKVhyLAnCBUv6c5HVTtpuQ=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-DyKtegarNwy9SHtvpd_50g-1; Mon, 30 Mar 2020 09:07:46 -0400
X-MC-Unique: DyKtegarNwy9SHtvpd_50g-1
Received: by mail-lj1-f197.google.com with SMTP id u8so2797425ljg.9
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 06:07:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v7a3S2gFASAwFOB0ACLEbkusP3TuRXZgJTvHEyf/V9o=;
 b=pfs0eHXaho2AP6Dy1et5Yn4h4xQx4Z51ZNQhuyIet7jl1R2WVtnDAJYuX7GejWVdhk
 tbMUXr19o2JjtvkAw4zMRBoqkyifD5aS+qexOLWjGHBXnaSDhHT1VCjefQhzWeiRDLaN
 caHaDOvkcFUHY809pGXwF9tUPn62zKE/RAgNMqcNokId2Hacuu9LeVkO7dbpmjbPBPwY
 tx/Yijw5O/EtN3sX0uG1xLE8XHhHg2uvko705bvvZURNJdb2I2sPBTE+ZHBi1SeHZh8r
 9j/hUHPoAlYMBCKrEoob+wAJvz6cLWEdq04TFDnDGZNs0KP+a9jWcbS0C8Hv8IRUsY75
 mLrw==
X-Gm-Message-State: AGi0PuYnzplqvqLHrTxmbNnYv9UBPgRqsMaVQaIqTteZqp/YnyRg0+eI
 jmXO2Iv9AhWMH3RM0dp+ArgWMWY++oKgIMGHNC+NfCHCnKxkB9udcK/vO6RQvopFF7h9b5Cv8EF
 7b1RM7hK3kJMYUT3uQXjFXdUazwE=
X-Received: by 2002:a2e:98c3:: with SMTP id s3mr7144336ljj.6.1585573664221;
 Mon, 30 Mar 2020 06:07:44 -0700 (PDT)
X-Google-Smtp-Source: APiQypLqiOBHYIqFhgQb0xp/NBpAzhiIi9kuSqOTVmimIUhiAHkehPBdMDVr4ZrsxBLIwV8o8Xsvxa4Oh+qBCfoql9o=
X-Received: by 2002:a2e:98c3:: with SMTP id s3mr7144315ljj.6.1585573663825;
 Mon, 30 Mar 2020 06:07:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200330124338.6764-1-pvorel@suse.cz>
 <20200330124338.6764-5-pvorel@suse.cz>
 <CAEemH2dcxrpB_dkp26=5oiMdY_2OVw5v_OjpyG37N+zx7y+A9g@mail.gmail.com>
In-Reply-To: <CAEemH2dcxrpB_dkp26=5oiMdY_2OVw5v_OjpyG37N+zx7y+A9g@mail.gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 30 Mar 2020 21:07:32 +0800
Message-ID: <CAEemH2dKmth7qCxsnnAxhiJVqE-A22zRYzNm9rEzTw3etY_+8g@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 4/5] lib: Implement SAFE_CMD() macro (new API
 only)
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
Content-Type: multipart/mixed; boundary="===============1246837114=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1246837114==
Content-Type: multipart/alternative; boundary="000000000000ff78ff05a2122209"

--000000000000ff78ff05a2122209
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2020 at 9:01 PM Li Wang <liwang@redhat.com> wrote:

>
>
> On Mon, Mar 30, 2020 at 8:43 PM Petr Vorel <pvorel@suse.cz> wrote:
>
>> Reviewed-by: Li Wang <liwang@redhat.com>
>> Reviewed-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
>> Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
>> Signed-off-by: Petr Vorel <pvorel@suse.cz>
>> ---
>>  doc/test-writing-guidelines.txt |  3 +++
>>  include/tst_safe_macros.h       | 18 ++++++++++++++++++
>>  2 files changed, 21 insertions(+)
>>
>> diff --git a/doc/test-writing-guidelines.txt
>> b/doc/test-writing-guidelines.txt
>> index 7069d3c8f..6f1eee490 100644
>> --- a/doc/test-writing-guidelines.txt
>> +++ b/doc/test-writing-guidelines.txt
>> @@ -1283,6 +1283,9 @@ return value is '255' if 'execvp()' failed with
>> 'ENOENT' and '254' otherwise.
>>  'stdout_path' and 'stderr_path' determine where to redirect the program
>>  stdout and stderr I/O streams.
>>
>> +The 'SAFE_CMD()' macro can be used automatic handling non zero exits
>> (exits
>> +with 'TBROK') or 'ENOENT' (exits with 'TCONF').
>> +
>>  .Example
>>  [source,c]
>>
>>  -----------------------------------------------------------------------=
--------
>> diff --git a/include/tst_safe_macros.h b/include/tst_safe_macros.h
>> index d95d26219..38eb67d1d 100644
>> --- a/include/tst_safe_macros.h
>> +++ b/include/tst_safe_macros.h
>> @@ -21,6 +21,7 @@
>>  #include <grp.h>
>>
>>  #include "safe_macros_fn.h"
>> +#include "tst_cmd.h"
>>
>>  #define SAFE_BASENAME(path) \
>>         safe_basename(__FILE__, __LINE__, NULL, (path))
>> @@ -534,4 +535,21 @@ int safe_personality(const char *filename, unsigned
>> int lineno,
>>  void safe_unshare(const char *file, const int lineno, int flags);
>>  #define SAFE_UNSHARE(flags) safe_unshare(__FILE__, __LINE__, (flags))
>>
>> +void safe_cmd(const char *file, const int lineno, const char *const
>> argv[],
>> +                                 const char *stdout_path, const char
>> *stderr_path)
>> +{
>> +       int rval;
>> +
>> +       switch ((rval =3D tst_run_cmd(argv, stdout_path, stderr_path,
>>
>
tst_cmd ^

> +                                   TST_RUN_CMD_PASS_EXIT_VAL |
>> +                                   TST_RUN_CMD_CHECK_CMD))) {
>>
>
> This should be TST_CMD_TCONF_ON_MISSING ^.
>
> I'd help to build&run the whole patches tomorrow, anything wrong if I can
> find will reply to you then.
>
> --
> Regards,
> Li Wang
>


--=20
Regards,
Li Wang

--000000000000ff78ff05a2122209
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Mar 30, 2020 at 9:01 PM Li Wang &lt;<a href=
=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D=
"ltr"><div style=3D"font-size:small"><br></div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 30, 2020 at 8:43=
 PM Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_blank">pvor=
el@suse.cz</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Reviewed-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" ta=
rget=3D"_blank">liwang@redhat.com</a>&gt;<br>
Reviewed-by: Yang Xu &lt;<a href=3D"mailto:xuyang2018.jy@cn.fujitsu.com" ta=
rget=3D"_blank">xuyang2018.jy@cn.fujitsu.com</a>&gt;<br>
Reviewed-by: Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz" target=3D"=
_blank">chrubis@suse.cz</a>&gt;<br>
Signed-off-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_=
blank">pvorel@suse.cz</a>&gt;<br>
---<br>
=C2=A0doc/test-writing-guidelines.txt |=C2=A0 3 +++<br>
=C2=A0include/tst_safe_macros.h=C2=A0 =C2=A0 =C2=A0 =C2=A0| 18 ++++++++++++=
++++++<br>
=C2=A02 files changed, 21 insertions(+)<br>
<br>
diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.=
txt<br>
index 7069d3c8f..6f1eee490 100644<br>
--- a/doc/test-writing-guidelines.txt<br>
+++ b/doc/test-writing-guidelines.txt<br>
@@ -1283,6 +1283,9 @@ return value is &#39;255&#39; if &#39;execvp()&#39; f=
ailed with &#39;ENOENT&#39; and &#39;254&#39; otherwise.<br>
=C2=A0&#39;stdout_path&#39; and &#39;stderr_path&#39; determine where to re=
direct the program<br>
=C2=A0stdout and stderr I/O streams.<br>
<br>
+The &#39;SAFE_CMD()&#39; macro can be used automatic handling non zero exi=
ts (exits<br>
+with &#39;TBROK&#39;) or &#39;ENOENT&#39; (exits with &#39;TCONF&#39;).<br=
>
+<br>
=C2=A0.Example<br>
=C2=A0[source,c]<br>
=C2=A0---------------------------------------------------------------------=
----------<br>
diff --git a/include/tst_safe_macros.h b/include/tst_safe_macros.h<br>
index d95d26219..38eb67d1d 100644<br>
--- a/include/tst_safe_macros.h<br>
+++ b/include/tst_safe_macros.h<br>
@@ -21,6 +21,7 @@<br>
=C2=A0#include &lt;grp.h&gt;<br>
<br>
=C2=A0#include &quot;safe_macros_fn.h&quot;<br>
+#include &quot;tst_cmd.h&quot;<br>
<br>
=C2=A0#define SAFE_BASENAME(path) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 safe_basename(__FILE__, __LINE__, NULL, (path))=
<br>
@@ -534,4 +535,21 @@ int safe_personality(const char *filename, unsigned in=
t lineno,<br>
=C2=A0void safe_unshare(const char *file, const int lineno, int flags);<br>
=C2=A0#define SAFE_UNSHARE(flags) safe_unshare(__FILE__, __LINE__, (flags))=
<br>
<br>
+void safe_cmd(const char *file, const int lineno, const char *const argv[]=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *stdout_path, const=
 char *stderr_path)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int rval;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0switch ((rval =3D tst_run_cmd(argv, stdout_path=
, stderr_path,<br></blockquote></div></div></blockquote><div><br></div><div=
 class=3D"gmail_default" style=3D"font-size:small">tst_cmd ^</div><div clas=
s=3D"gmail_default" style=3D"font-size:small"></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TST_RUN_CMD_PASS_EXIT_V=
AL |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TST_RUN_CMD_CHECK_CMD))=
) {<br></blockquote><div><br></div><div><div style=3D"font-size:small">This=
 should be TST_CMD_TCONF_ON_MISSING ^.</div></div></div><div><br></div><div=
><div style=3D"font-size:small">I&#39;d help to build&amp;run the whole pat=
ches tomorrow, anything wrong if I can find will reply to you then.</div></=
div><div><br></div>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><div>Regards,<b=
r></div><div>Li Wang<br></div></div></div></div>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000ff78ff05a2122209--


--===============1246837114==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1246837114==--

