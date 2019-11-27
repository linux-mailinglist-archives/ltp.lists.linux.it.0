Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC9710AF61
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Nov 2019 13:10:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7F5783C22C7
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Nov 2019 13:10:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 534993C0300
 for <ltp@lists.linux.it>; Wed, 27 Nov 2019 13:10:42 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id B399860066C
 for <ltp@lists.linux.it>; Wed, 27 Nov 2019 13:10:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574856640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aRWTWtdkHK2qw511rEtFjCummSacIc90wyuuD0MDTOc=;
 b=HwpUt0dN7HAb7bK6r/Tv7lPkTqEYSZLah6n/792IidN6QicdyKPmETnk1LehL/QaUxy1ZZ
 T/doTjMutCECOOudSwFqTNZJxAmzdIofv2ED3OKFyonzA5L3SBqfdQJ+UtAPOj0Fth7H7M
 /JikMQFLuieNcacAJ0lY73pSUu+E3Xg=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-crnqw2K9OieK2ycfI1-2XQ-1; Wed, 27 Nov 2019 07:10:38 -0500
Received: by mail-ot1-f69.google.com with SMTP id i13so11771512otc.0
 for <ltp@lists.linux.it>; Wed, 27 Nov 2019 04:10:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=582Dwpn+el2i0MsS9R+2696/0TMr+U2nDnD7kO4r6mg=;
 b=aHsHZ1ZTByp07Q4D2eJgkjO6vI1Do6rU4qaUXjSJNXbL63JsWcNYzXI2l8rZlxC5ic
 BMHIzSSJ9lGtFk8yh7aUUXxi/v9Y5SajDaG8m2UNp2328Wvo3pgSJJVokr5Il8/WarZ/
 NSdU+MpT+01gQVcnfjx2mGhbT+w3s9VqOGRhYbHBetFOICDlQHkM2eacYeSSBhIeaG3p
 Ey34JWbFAunCXH7SXOu3OsJvo9FFTQnKJgUaBzLY+cKtOsdfYniVjGHaFl92U/pxkYVJ
 BE+NqHHJTpcQ0xx5YkaAPWBfFLKABnCmXt+yRIUI+A5RW5wzLJce32WwLDd2c07zE6yZ
 j/EQ==
X-Gm-Message-State: APjAAAUblab714cvFKfeyln/Xcg2+pST+Fv1WcHgGi7Y78KjB77nSFx3
 H7JiRjSOk0Zxg9V64Ypn+Fm30YcnriGCwefBKdGmnFhiNUtJ91T6gtjQRbaa2PEQ9wSOBHBOftr
 Vb0yH4WDh/Et4P8Zx2J/nVB3sPOY=
X-Received: by 2002:a9d:7b50:: with SMTP id f16mr3358530oto.264.1574856636413; 
 Wed, 27 Nov 2019 04:10:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqxX4hDcPXEWWGR3K8kHMcgUnVyt/d/ElmQynKIxsD7EL1aiHBXHbS5Z6rctCglreyCVzmPIEFrMrBzpdTSGRHk=
X-Received: by 2002:a9d:7b50:: with SMTP id f16mr3358494oto.264.1574856636069; 
 Wed, 27 Nov 2019 04:10:36 -0800 (PST)
MIME-Version: 1.0
References: <cki.0.PFTG7HN9XB@redhat.com>
 <20191126133713.25674-1-prarit@redhat.com>
 <b46363e7-b60e-8316-07b9-be6032b0ae01@redhat.com>
In-Reply-To: <b46363e7-b60e-8316-07b9-be6032b0ae01@redhat.com>
From: Li Wang <liwan@redhat.com>
Date: Wed, 27 Nov 2019 20:10:24 +0800
Message-ID: <CAEemH2fU6dgunAuvoEjygKq=EMD2PfRW9rLEyENdtwEVwNbPyQ@mail.gmail.com>
To: Rachel Sibley <rasibley@redhat.com>, Jan Stancek <jstancek@redhat.com>
X-MC-Unique: crnqw2K9OieK2ycfI1-2XQ-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] 
	=?utf-8?b?4p2MIEZBSUw6IFJlOiBbUkhFTDguMiBCWiAxNzczNzc0XSB4?=
	=?utf-8?q?86/quirks=3A_Disable_HPET_on_Intel_Coffe_Lake_platforms?=
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
Cc: Prarit Bhargava <prarit@redhat.com>, rhkernel-list@redhat.com,
 mm-qe <mm-qe@redhat.com>, skt-results-master@redhat.com,
 David Arcari <darcari@redhat.com>, CKI <cki-project@redhat.com>,
 LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0214116147=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0214116147==
Content-Type: multipart/alternative; boundary="0000000000005dbd2f059852e2be"

--0000000000005dbd2f059852e2be
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Rachel Sibley <rasibley@redhat.com> wrote:

> ...
> >>
> >>      Pipeline:
> https://xci32.lab.eng.rdu2.redhat.com/cki-project/cki-pipeline/pipelines/=
308034
> >>
> >> One or more kernel tests failed:
> >>
> >>      s390x:
> >>       =E2=9D=8C LTP lite
> >
> > This MUST be a failure due to some other reason.  This patch only affec=
ts
> > HPET timers on Intel x86_64 Coffee Lake platforms.
>
> I'm seeing it fail on other patches as well, MM-QE can you take a look ?
> Is this a known issue ?
>
> Thanks,
> Rachel
>
> <<<test_start>>>
> tag=3Dmtest01w stime=3D1574715697
> cmdline=3D"mtest01 -p80 -w"
> contacts=3D""
> analysis=3Dexit
> <<<test_output>>>
> tst_test.c:1118: INFO: Timeout per run is 0h 05m 00s
> mtest01.c:134: INFO: Filling up 80% of free ram which is 5868864 kbytes
> mtest01.c:149: INFO: ... child 38289 starting
> mtest01.c:149: INFO: ... child 38288 starting
> mtest01.c:208: WARN: the remaininig time is not enough for testing
> mtest01.c:218: FAIL: kbytes allocated (and written to) less than
> expected 5868864
> Test timeouted, sending SIGKILL!
>

The root cause is that children's memory allocating is still ongoing, but
the remaining time is in an emergency, so parent break from the while loop
and try to stop children, obviously, it doesn't have enough time to wait
for the process status change to 'T'.

        TST_PROCESS_STATE_WAIT(pid_list[i], 'T');
        kill(pid_list[i], SIGCONT);

My proposal patch to fix this problem as:

--- a/testcases/kernel/mem/mtest01/mtest01.c
+++ b/testcases/kernel/mem/mtest01/mtest01.c
@@ -216,11 +216,17 @@ static void mem_test(void)
        if (children_done < pid_cntr) {
                tst_res(TFAIL, "kbytes allocated %sless than expected %llu"=
,
                                write_msg, alloc_maxbytes / 1024);
-       } else {
-               tst_res(TPASS, "%llu kbytes allocated %s",
-                               alloc_maxbytes / 1024, write_msg);
+
+               for (i =3D 0; i < pid_cntr; i++) {
+                       kill(pid_list[i], SIGKILL);
+               }
+
+               return;
        }

+       tst_res(TPASS, "%llu kbytes allocated %s",
+                       alloc_maxbytes / 1024, write_msg);
+
        for (i =3D 0; i < pid_cntr; i++) {
                TST_PROCESS_STATE_WAIT(pid_list[i], 'T');
                kill(pid_list[i], SIGCONT);



> tst_test.c:1158: INFO: If you are running on slow machine, try exporting
> LTP_TIMEOUT_MUL > 1
> tst_test.c:1159: BROK: Test killed! (timeout?)
>
> Summary:
> passed   0
> failed   1
> skipped  0
> warnings 1
> <<<execution_status>>>
> initiation_status=3D"ok"
> duration=3D314 termination_type=3Dexited termination_id=3D7 corefile=3Dno
> cutime=3D1 cstime=3D3
> <<<test_end>>>
>
> >
> > P.
> >
>
>

--=20
Regards,
Li Wang

--0000000000005dbd2f059852e2be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">Rachel Sibley &lt;<a href=3D"mailto:rasibley@redhat.com=
">rasibley@redhat.com</a>&gt; wrote:</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><span class=3D"gmail_default" style=3D"font-size:small">..=
.</span><br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Pipeline: <a href=3D"https://xci32.lab.eng.rdu=
2.redhat.com/cki-project/cki-pipeline/pipelines/308034" rel=3D"noreferrer" =
target=3D"_blank">https://xci32.lab.eng.rdu2.redhat.com/cki-project/cki-pip=
eline/pipelines/308034</a><br>
&gt;&gt;<br>
&gt;&gt; One or more kernel tests failed:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 s390x:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=E2=9D=8C LTP lite<br>
&gt; <br>
&gt; This MUST be a failure due to some other reason.=C2=A0 This patch only=
 affects<br>
&gt; HPET timers on Intel x86_64 Coffee Lake platforms.<br>
<br>
I&#39;m seeing it fail on other patches as well, MM-QE can you take a look =
?<br>
Is this a known issue ?<br>
<br>
Thanks,<br>
Rachel<br>
<br>
&lt;&lt;&lt;test_start&gt;&gt;&gt;<br>
tag=3Dmtest01w stime=3D1574715697<br>
cmdline=3D&quot;mtest01 -p80 -w&quot;<br>
contacts=3D&quot;&quot;<br>
analysis=3Dexit<br>
&lt;&lt;&lt;test_output&gt;&gt;&gt;<br>
tst_test.c:1118: INFO: Timeout per run is 0h 05m 00s<br>
mtest01.c:134: INFO: Filling up 80% of free ram which is 5868864 kbytes<br>
mtest01.c:149: INFO: ... child 38289 starting<br>
mtest01.c:149: INFO: ... child 38288 starting<br>
mtest01.c:208: WARN: the remaininig time is not enough for testing<br>
mtest01.c:218: FAIL: kbytes allocated (and written to) less than <br>
expected 5868864<br>
Test timeouted, sending SIGKILL!<br></blockquote><div><br></div><div><div c=
lass=3D"gmail_default" style=3D"font-size:small">The root cause is that chi=
ldren&#39;s memory allocating is still ongoing, but the remaining time is i=
n an emergency, so parent=C2=A0break from the while loop and try to stop ch=
ildren, obviously, it doesn&#39;t have enough time to wait for the process =
status change to &#39;T&#39;.=C2=A0</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div>=09=09<span class=3D"gmail_default" style=3D=
"font-size:small">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>TST_PROCESS_STATE_WAIT=
(pid_list[i], &#39;T&#39;);<br>=09=09<span class=3D"gmail_default" style=3D=
"font-size:small">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>kill(pid_list[i], SIGC=
ONT);<br></div><div><br></div><div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">My proposal patch to fix this problem as:</div><div class=3D=
"gmail_default" style=3D"font-size:small"><br></div>--- a/testcases/kernel/=
mem/mtest01/mtest01.c<br>+++ b/testcases/kernel/mem/mtest01/mtest01.c<br>@@=
 -216,11 +216,17 @@ static void mem_test(void)<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (children_done &lt; pid_cntr) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TFAIL, &quot;kbytes allocated %sless than =
expected %llu&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 write_msg, a=
lloc_maxbytes / 1024);<br>- =C2=A0 =C2=A0 =C2=A0 } else {<br>- =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TPASS, &quot;%llu kbytes all=
ocated %s&quot;,<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 alloc_maxbytes / 1024,=
 write_msg);<br>+<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for=
 (i =3D 0; i &lt; pid_cntr; i++) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kill(pid_list[i], SIGKILL);<br>+ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>+<br>+ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 }=
<br>=C2=A0<br>+ =C2=A0 =C2=A0 =C2=A0 tst_res(TPASS, &quot;%llu kbytes alloc=
ated %s&quot;,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 alloc_maxbytes / 1024, write_msg);<br>+<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; pid_cntr; i++) {<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TST_PROCESS_STATE_WAIT(pid_list[i=
], &#39;T&#39;);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 kill(pid_list[i], SIGCONT);<br><br></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
tst_test.c:1158: INFO: If you are running on slow machine, try exporting <b=
r>
LTP_TIMEOUT_MUL &gt; 1<br>
tst_test.c:1159: BROK: Test killed! (timeout?)<br>
<br>
Summary:<br>
passed=C2=A0 =C2=A00<br>
failed=C2=A0 =C2=A01<br>
skipped=C2=A0 0<br>
warnings 1<br>
&lt;&lt;&lt;execution_status&gt;&gt;&gt;<br>
initiation_status=3D&quot;ok&quot;<br>
duration=3D314 termination_type=3Dexited termination_id=3D7 corefile=3Dno<b=
r>
cutime=3D1 cstime=3D3<br>
&lt;&lt;&lt;test_end&gt;&gt;&gt;<br>
<br>
&gt; <br>
&gt; P.<br>
&gt; <br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Regards,<=
br>Li Wang<br></div></div></div></div></div>

--0000000000005dbd2f059852e2be--


--===============0214116147==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0214116147==--

