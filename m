Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0174818F6F9
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Mar 2020 15:33:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8FCCA3C4E43
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Mar 2020 15:33:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 5AE073C04FD
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 15:33:05 +0100 (CET)
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id B1B261000DD3
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 15:33:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584973983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ADHwQfuGD1ptTiGAHq+XFyPjOPUhCue71CO3au4ZaGI=;
 b=aRQWMCPVdhFTMPiz13j72mGUh0IeFoHrs2cajGnK1B801Wiw7Am7e8a3KSVNgApMSLmjjh
 pJ07/hHdfs1oAKJ7Im5WjcOKXwNOWT7cX08Q+VPgF1pJflE37G3/gTMGbA6iMpOiaF3OQu
 NBLtSqNZqYLSeIovW2OfoKM8aFVglV0=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106--RXoRbGjN6GN1XRS7TfEvw-1; Mon, 23 Mar 2020 10:32:59 -0400
X-MC-Unique: -RXoRbGjN6GN1XRS7TfEvw-1
Received: by mail-ot1-f69.google.com with SMTP id r23so9972109otp.4
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 07:32:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hBl76ahy4ZNs9fxxxJ3XHtrF8XomQ3JResPATBd330E=;
 b=RAV+UfQPvVCHgWK/WkCUc/Eiw7h2f65cYxNN4xbAWWYITX0aYqFq46lHiepSHJ1Anf
 KAR20uUAjPqwmxozzBpWgBFUxqfr1qtU+DeYvUP4CB7eKC25km/LX2HCN/grhhv9rd9Q
 cp/iKe7y4WXsg9dSUaUG/qJ1Ecqu8wuyy2wZn/Bju7MEzrxyhPvrijM6Tl7PCZxEU33M
 S5aHuL7a8RzlsHDZhqOsZOEqPsf+bglxizDqHI91Y6009m4OobwqCQYcY0Ndd2swToqZ
 fUy9fgva/24OOGZ26BUXNudS2c24oFtRVan4G53TErp0HP29cgnzoo+hduuUuOCv2KWm
 SLug==
X-Gm-Message-State: ANhLgQ1NZfd7vxfQACvsY6dDgyq5TqS8UP2PELPmbdsQBRb9nixtG6x8
 i3pbAWprqlxr8zcYpRH32gYckqf4JnUIcsTF/tG2XeVIK9x0JdtuG6jZfuZ1w23y/sKV5EYul4q
 QYspg/OBPwWtzjXRS2uK/OKVe+SQ=
X-Received: by 2002:a9d:2c64:: with SMTP id f91mr18885140otb.17.1584973978090; 
 Mon, 23 Mar 2020 07:32:58 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vv76lIhFqKeL0+NdgqfiEwkWHJcHk7aoLRh9Ao6rGjqRScrlJmNBOpScToVoqrehQ2XgPgSzOB6EKwJZpoKdQQ=
X-Received: by 2002:a9d:2c64:: with SMTP id f91mr18885125otb.17.1584973977837; 
 Mon, 23 Mar 2020 07:32:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200320134937.16616-1-pvorel@suse.cz>
 <20200320134937.16616-2-pvorel@suse.cz>
 <CAEemH2f7TB9sMt-+YE2zF5KztT4O64VN9L4AZWdS3nU1uJX5_w@mail.gmail.com>
 <303d1019-f836-b2ae-ce51-d2c46dd7fb1e@cn.fujitsu.com>
 <20200323113738.GA4807@dell5510>
 <CAEemH2fhRYefq_9LmSmDvujS1OQa7rCeF7V=mJQrLhz0bwpo0A@mail.gmail.com>
In-Reply-To: <CAEemH2fhRYefq_9LmSmDvujS1OQa7rCeF7V=mJQrLhz0bwpo0A@mail.gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 23 Mar 2020 22:32:46 +0800
Message-ID: <CAEemH2e4sRwZ8HRm-w5CD=Wm8-SW+LaA5XHDnXdqrOL1t4FdtA@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] Use SAFE_RUNCMD()
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
Content-Type: multipart/mixed; boundary="===============2142266880=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2142266880==
Content-Type: multipart/alternative; boundary="000000000000ed7d9805a18682f4"

--000000000000ed7d9805a18682f4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2020 at 9:42 PM Li Wang <liwang@redhat.com> wrote:

> Hi Petr, Xu,
>
> On Mon, Mar 23, 2020 at 7:37 PM Petr Vorel <pvorel@suse.cz> wrote:
>
>> Hi Li, Xu,
>>
>> > >       testcases/kernel/syscalls/add_key/add_key05.c   | 15
>> ++-------------
>> > >       testcases/kernel/syscalls/quotactl/quotactl01.c | 14
>> ++------------
>> > >       testcases/kernel/syscalls/quotactl/quotactl06.c | 12
>> +-----------
>>
>> > > Apart from the three, do you consider converting to SAFE_RUNCMD for
>> the
>> > > rest testcases?
>> > > (it seems not too much work remaining since only a few test case use=
s
>> > > tst_run_cmd)
>> > At the beginning, I have the same idea. But after seeing code, I think
>> we
>> > should not because these cases have many sub tests(only few test
>> deponds on
>> > the result of the cmd execution.
>>
>> > > kernel/syscalls/setpriority/setpriority01.c
>> > One year ago has a commit db82b596(setpriority01: Skip only PRIO_USER
>> when
>> > unable to add test user). It only affects PRIO_USER sub test.
>> + 1. I didn't want to break the case when useradd is not available
>> (android or
>> some custom embedded linux) or there is no password file (root mounted a=
s
>> ro -
>> custom embedded linux).
>>
>
> That's right. Thanks for the clarification.
>
>>
>> BTW I also avoid handling adding user as I want to implement better
>> handling
>> user and group in LTP (adding a flag), see:
>> https://github.com/linux-test-project/ltp/issues/468
>
>
> Good plan.
>
>
>>
>>
>> Feel free to commend this plan.
>> This patchset is kind of preparation for it.
>>
>> > > kernel/syscalls/copy_file_range/copy_file_range02.c
>> > only affect test6 and test7
>> >  6) Try to copy contents to a file chattred with +i
>> >  *    flag -> EPERM
>> >  * 7) Try to copy contents to a swapfile ->ETXTBSY
>> Yes, it'd be bad to break all tests due it.
>>
>> Here is also problem with swapoff (or maybe chattr, mkswap, swapon; I
>> don't
>> remember), which returns exit code 255 on error, so it's not possible to
>> distinguish this from the case whether command is not available (any
>> idea, how
>> to fix it?).
>>
>
> Maybe we could achieve a tst_cmd_available(char *cmd) in the C version?
> which uses popen() to open a process like: "whereis/which command" and do
> string parse in the result to see the path(/usr/bin/cmd, /usr/sbin/cmd) o=
f
> the bin if it has been found.
>

Or, simply to use access() if we gonna take care of embedded Linux, is this
reliable?

int tst_cmd_available(char *cmd)
{
    int ret =3D 0;
    char path[PATH_MAX];

    snprintf(path, PATH_MAX, "/usr/bin/%s", cmd);
    if (!access(path, X_OK)) {
        ret =3D 1;
        goto out;
    }

    snprintf(path, PATH_MAX, "/usr/sbin/%s", cmd);
    if (!access(path, X_OK)) {
        ret =3D 1;
        goto out;
    }

    snprintf(path, PATH_MAX, "/usr/local/bin/%s", cmd);
    if (!access(path, X_OK)) {
        ret =3D 1;
        goto out;
    }

    snprintf(path, PATH_MAX, "/usr/local/sbin/%s", cmd);
    if (!access(path, X_OK)) {
        ret =3D 1;
        goto out;
    }

out:
    return ret;
}
--=20
Regards,
Li Wang

--000000000000ed7d9805a18682f4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Mar 23, 2020 at 9:42 PM Li Wang &lt;<a href=
=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D=
"ltr"><div style=3D"font-size:small">Hi=C2=A0Petr, Xu,</div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 23,=
 2020 at 7:37 PM Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D=
"_blank">pvorel@suse.cz</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Hi Li, Xu,<br>
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0testcases/kernel/syscalls/add_key/add_k=
ey05.c=C2=A0 =C2=A0| 15 ++-------------<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0testcases/kernel/syscalls/quotactl/quot=
actl01.c | 14 ++------------<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0testcases/kernel/syscalls/quotactl/quot=
actl06.c | 12 +-----------<br>
<br>
&gt; &gt; Apart from the three, do you consider converting to SAFE_RUNCMD f=
or the<br>
&gt; &gt; rest testcases?<br>
&gt; &gt; (it seems not too much work remaining since only a few test case =
uses<br>
&gt; &gt; tst_run_cmd)<br>
&gt; At the beginning, I have the same idea. But after seeing code, I think=
 we<br>
&gt; should not because these cases have many sub tests(only few test depon=
ds on<br>
&gt; the result of the cmd execution.<br>
<br>
&gt; &gt; kernel/syscalls/setpriority/setpriority01.c<br>
&gt; One year ago has a commit db82b596(setpriority01: Skip only PRIO_USER =
when<br>
&gt; unable to add test user). It only affects PRIO_USER sub test.<br>
+ 1. I didn&#39;t want to break the case when useradd is not available (and=
roid or<br>
some custom embedded linux) or there is no password file (root mounted as r=
o -<br>
custom embedded linux).<br></blockquote><div><br></div><div style=3D"font-s=
ize:small">That&#39;s right. Thanks for the clarification.</div><div style=
=3D"font-size:small"></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
BTW I also avoid handling adding user as I want to implement better handlin=
g<br>
user and group in LTP (adding a flag), see:<br>
<a href=3D"https://github.com/linux-test-project/ltp/issues/468" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/linux-test-project/ltp/issues=
/468</a></blockquote><div><br></div><div><div style=3D"font-size:small">Goo=
d plan.</div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><br>
<br>
Feel free to commend this plan.<br>
This patchset is kind of preparation for it.<br>
<br>
&gt; &gt; kernel/syscalls/copy_file_range/copy_file_range02.c<br>
&gt; only affect test6 and test7<br>
&gt;=C2=A0 6) Try to copy contents to a file chattred with +i<br>
&gt;=C2=A0 *=C2=A0 =C2=A0 flag -&gt; EPERM<br>
&gt;=C2=A0 * 7) Try to copy contents to a swapfile -&gt;ETXTBSY<br>
Yes, it&#39;d be bad to break all tests due it.<br>
<br>
Here is also problem with swapoff (or maybe chattr, mkswap, swapon; I don&#=
39;t<br>
remember), which returns exit code 255 on error, so it&#39;s not possible t=
o<br>
distinguish this from the case whether command is not available (any idea, =
how<br>
to fix it?).<br></blockquote><div><br></div><div><div style=3D"font-size:sm=
all">Maybe we could achieve a tst_cmd_available(char *cmd) in the C version=
?</div><div style=3D"font-size:small">which uses popen() to open a process =
like: &quot;whereis/which command&quot; and do string parse in the result t=
o see the path(/usr/bin/cmd, /usr/sbin/cmd) of the bin if it has been found=
.</div></div></div></div></blockquote><div><br></div><div><div class=3D"gma=
il_default" style=3D"font-size:small">Or, simply to use access() if we gonn=
a take care of embedded Linux, is this reliable?</div><div class=3D"gmail_d=
efault" style=3D"font-size:small"><br></div>int tst_cmd_available(char *cmd=
)<br>{<br>=09<span class=3D"gmail_default" style=3D"font-size:small">=C2=A0=
 =C2=A0 </span>int ret =3D 0;<br>=09<span class=3D"gmail_default" style=3D"=
font-size:small">=C2=A0 =C2=A0 </span>char path[PATH_MAX];<br><br>=09<span =
class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0 </span>snpr=
intf(path, PATH_MAX, &quot;/usr/bin/%s&quot;, cmd);<br>=09<span class=3D"gm=
ail_default" style=3D"font-size:small">=C2=A0 =C2=A0 </span>i<span class=3D=
"gmail_default" style=3D"font-size:small"></span><span class=3D"gmail_defau=
lt" style=3D"font-size:small"></span>f (!access(path, X_OK)) {<br>=09=09<sp=
an class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 </span>ret =3D 1;<br>=09=09<span class=3D"gmail_default" style=3D"fo=
nt-size:small">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>goto out;<br>=09<span cla=
ss=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0 </span>}<br><b=
r>=09<span class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0 =
</span>snprintf(path, PATH_MAX, &quot;/usr/sbin/%s&quot;, cmd);<br>=09<span=
 class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0 </span>if =
(!access(path, X_OK)) {<br>=09=09<span class=3D"gmail_default" style=3D"fon=
t-size:small">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>ret =3D 1;<br>=09=09<span =
class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 </span>goto out;<br>=09<span class=3D"gmail_default" style=3D"font-size=
:small">=C2=A0 =C2=A0 </span>}<span class=3D"gmail_default" style=3D"font-s=
ize:small"> </span><span class=3D"gmail_default" style=3D"font-size:small">=
 </span><span class=3D"gmail_default" style=3D"font-size:small"> </span><br=
><br>=09<span class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=
=A0 </span>snprintf(path, PATH_MAX, &quot;/usr/local/bin/%s&quot;, cmd);<br=
>=09<span class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0 <=
/span>if (!access(path, X_OK)) {<br>=09=09<span class=3D"gmail_default" sty=
le=3D"font-size:small">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>ret =3D 1;<br>=09=
=09<span class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0 =
=C2=A0 =C2=A0=C2=A0</span>goto out;<br>=09<span class=3D"gmail_default" sty=
le=3D"font-size:small">=C2=A0 =C2=A0 </span>}<br><br>=09<span class=3D"gmai=
l_default" style=3D"font-size:small">=C2=A0 =C2=A0 </span>snprintf(path, PA=
TH_MAX, &quot;/usr/local/sbin/%s&quot;, cmd);<br>=09<span class=3D"gmail_de=
fault" style=3D"font-size:small">=C2=A0 =C2=A0 </span>if (!access(path, X_O=
K)) {<br>=09=09<span class=3D"gmail_default" style=3D"font-size:small">=C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0</span>ret =3D 1;<br>=09=09<span class=3D"gma=
il_default" style=3D"font-size:small">=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0</sp=
an>goto out;<br>=09<span class=3D"gmail_default" style=3D"font-size:small">=
=C2=A0 =C2=A0 </span>}<br><br>out:<br>=09<span class=3D"gmail_default" styl=
e=3D"font-size:small">=C2=A0 =C2=A0 </span>return ret;<br>}<br><div class=
=3D"gmail_default" style=3D"font-size:small"></div></div></div>-- <br><div =
dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></d=
iv><div>Li Wang<br></div></div></div></div>

--000000000000ed7d9805a18682f4--


--===============2142266880==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2142266880==--

