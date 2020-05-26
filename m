Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1A91E1F41
	for <lists+linux-ltp@lfdr.de>; Tue, 26 May 2020 12:02:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AB3853C3269
	for <lists+linux-ltp@lfdr.de>; Tue, 26 May 2020 12:02:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id B65F63C2031
 for <ltp@lists.linux.it>; Tue, 26 May 2020 12:02:18 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 495B41000480
 for <ltp@lists.linux.it>; Tue, 26 May 2020 12:02:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590487335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7lGvnVscY12IjJ2odr3NsXc2evQOKggMCigNrNHThzw=;
 b=g4IDnyoNkHFNW7rmK1L7vDXs+Yfeh5hsjihTq6dcvutndfcaDhc/wCBStAsolGR3/pcptO
 FhsRxTBRrP/HfIOvYq3BMwdRJcFq0FIMOiyMx69r5uOmcvh/5ryTbtd+oFPZaB5ImiB/1v
 ZJnRJiu61+x9oYVANHRR5tutnqQghaQ=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-Eh52FGFbOMiQ1fD0VOw6KA-1; Tue, 26 May 2020 06:02:13 -0400
X-MC-Unique: Eh52FGFbOMiQ1fD0VOw6KA-1
Received: by mail-lf1-f72.google.com with SMTP id c4so4246447lfj.16
 for <ltp@lists.linux.it>; Tue, 26 May 2020 03:02:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7lGvnVscY12IjJ2odr3NsXc2evQOKggMCigNrNHThzw=;
 b=KH7FsldW1/fETkWy0lekb0RFDyH4zCiMhurGZd2iB7zIRldnzJkGwxuyYCdnIAGLQC
 A20KS1OGR7XAnWEKi/7nZLwNGLizsONDgIL420kbks7sHe6uezeO1GUhF4L/M8JGcOFd
 VJMUH9KJf1zBsHr5NNVRIGSh/sHnxDzlJeWWQ2xHDvbfjcO8W81JJQ+USd/v38teR+CD
 UJ1hTxwOUlzZC8R700kZr8SBbkA7AfQJO1a2VRxqCLcoPhQRn1NHzESRzRaEB0keRBmw
 q1ikxpPL9e0H8qKu+vzyLqr5MTLlUFhitL6pFkWa9kyAN0RCYPoi+d+rT6b+JIIgbQEw
 QsXg==
X-Gm-Message-State: AOAM5324hHlVIFZAihJSLZHhrQE8HmvlUAEgJMVXa2OGVwdbuVKauehg
 eKSyoTcXMPZN0+owrRQNJEtx7a8UpTmNaz/GyiMhSPClcJcx0W5lLhs4jJqgemfFksxDvOKK3Ta
 EFdzDPGObWxJUuovXCXZGQAsuF5I=
X-Received: by 2002:a2e:3a10:: with SMTP id h16mr226081lja.49.1590487331617;
 Tue, 26 May 2020 03:02:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmg9BG/Nnqy+T8utFJuyvae3eC25CU4x+EuPwAuBHfM6OxdXpSxKD+DjcSLx0z7Fhu2NlYZB2YRChdu21jfVs=
X-Received: by 2002:a2e:3a10:: with SMTP id h16mr226067lja.49.1590487330999;
 Tue, 26 May 2020 03:02:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200522012327.18991-1-liwang@redhat.com>
 <1156025603.13595880.1590481651127.JavaMail.zimbra@redhat.com>
In-Reply-To: <1156025603.13595880.1590481651127.JavaMail.zimbra@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 26 May 2020 18:01:59 +0800
Message-ID: <CAEemH2cGa5tvgWAPbyoanBKh7MbM4kuo+Ws_i0Z2vmbCts1yYQ@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH RFC 1/4] lib: add new cgroup test API
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
Content-Type: multipart/mixed; boundary="===============0824857774=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0824857774==
Content-Type: multipart/alternative; boundary="00000000000062695f05a68a30b8"

--00000000000062695f05a68a30b8
Content-Type: text/plain; charset="UTF-8"

On Tue, May 26, 2020 at 4:27 PM Jan Stancek <jstancek@redhat.com> wrote:

>
> ----- Original Message -----
>
> > +
> > +/* cgroup v1 */
> > +#define PATH_TMP_CG1_MEM     "/tmp/cgroup1_mem"
> > +#define PATH_TMP_CG1_CST     "/tmp/cgroup1_cpuset"
>
> It's only used for mount, so not sure if making it relative to TMPDIR
> buys us anything.
>

I choose to use /tmp dir just because the cgroup is
mounted temporarily for LTP test and destroyed
after using. And I have no preference to use other
places(i.e. /mnt or /dev).


>
> > +
> > +/* cgroup v1 */
> > +void tst_mount_cgroup1(const char *name, const char *option,
> > +                     const char *mnt_path, const char *new_path)
>
> I'd make all cgroup API start with tst_cgroup*.
>

Good point. I agree to make the function start with that prefix.

The logic in this patch looks like:

tst_cgroup1_mount(...)
tst_cgroup2_mount(...)
// these two API as the basic/internal function for a different version of
cgroup mounting

tst_cgroup1_mem(){
    tst_cgroup1_mount("with mem para")
}
tst_cgroup2_mem(){
    tst_cgroup2_mem("no need set mem, becase v2 has only one heierarchy")
}
// these two API mount different cgroup hierarchy via tst_cgroup*_mount()

tst_cgroup_mem()
{
    //if v1
    tst_cgroup1_mem()
    // if v2
    tst_cgroup2_mem()
}
tst_cgroup_cpu()
{
    // if v1
    tst_cgroup1_cpuset();
    // if v2
    tst_cgroup2_cpuset("no cpuset, skip this invoke");
}
// actully, we only use tst_cgroup_*() in testcase, they as the finial API
to export to



>
> Is the intent to provide API for both v1 and v2, or just higher level API
> that hides the details?
>

The former. My original purpose is to provide unified APIs
for both v1 and v2. Testcase author does not need to care
about the difference of two versions, if he/she want to set
max bytes in tests, just invoke:

//in setup()
    tst_cgroup_mem()
//in main()
    tst_cgroup_mem_set_maxbytes()
//in cleanup()
    tst_cgroup_umount()



>
> > +{
> > +     if (tst_is_mounted(mnt_path))
> > +             goto out;
> > +
> > +     SAFE_MKDIR(mnt_path, 0777);
> > +     if (mount(name, mnt_path, "cgroup", 0, option) == -1) {
> > +             if (errno == ENODEV) {
> > +                     if (rmdir(mnt_path) == -1)
> > +                             tst_res(TWARN | TERRNO, "rmdir %s failed",
> mnt_path);
> > +                     tst_brk(TCONF,
> > +                              "Cgroup v1 is not configured in kernel");
> > +             }
>
> We should probably handle also EBUSY, for cases when controller is already
> part
> of existing hierarchy. E.g. cpu,cpuacct is mounted together, and someone
> tries to mount just cpu:
>   mount("none", "/mnt/cgroup", "cgroup", MS_MGC_VAL, "cpu") = -1 EBUSY
> (Device or resource busy)
>

That's true.

But in general, people are not permitted to use tst_cgroup*_mount()
directly, it is only as the low-level/internal function to hide details we
mount cgroup. My previous thought is that, in v1, cpu,cpuacct are bound
together(as system way) in tst_croup_cpu().



>
> > +
> > +void tst_write_memcg1(long memsz)
>
> This should at least say memmax or something similar, if we add
> functions for more knobs later.
>

Good suggestion.


>
> I'm thinking if it would be worth having API more parametrized,
> something like:
>

Sounds neat, we could have a try and then there
is no need to export too many functions with _mem()
or _cpu() suffixes.

I'd like to merge your method with my original basic
functions, it seems not very hard to achieve patch v2:

tst_cgroup_create(enum tst_cgroup_ctrl ctrl)
{
    tst_cgroup_version();

    switch(ctrl) {
    case TST_CGROUP_MEMCG:
        // if v1
        tst_cgroup1_mount(TST_CGROUP_MEMCG);
        // if v2
        tst_cgroup2_mount()
    break;
    case TST_CGROUP_CPUSET:
          //if v1
          tst_cgroup1_mount(TST_CGROUP_CPUSET);
         // if v2
         TCONF here...
    break;
    }
}



>
> enum tst_cgroup_ctrl {
>         TST_CGROUP_MEMCG = 1,
>         TST_CGROUP_CPUSET = 2,
> };
>
> tst_cgroup_mount(enum tst_cgroup_ctrl)
> tst_cgroup_umount(enum tst_cgroup_ctrl)
>   // tests wouldn't need to use these ones directly
>   // would be probably internal functions
>
> tst_cgroup_version()
>   // to get/check cgroup support in setup()
>
> tst_cgroup_create(enum tst_cgroup_ctrl, const char *dir)
>

Maybe we can drop the second parameter "dir", the mount
functions are internal and we just use path macros in sub-function
which like what I did.



>   // mounts cgroup if not already mounted
>   // creates "dir", sets up subtree_control, etc.
>
> tst_cgroup_cleanup()
>   // cleans up everything, removes dirs, umounts what was mounted
>
> tst_cgroup_move_current(enum tst_cgroup_ctrl, const char *dir)
>   // writes getpid() to dir/"tasks"
>
> tst_cgroup_mem_set_maxbytes(const char *dir, long memsz)
>   // memcg specific function
>
>

-- 
Regards,
Li Wang

--00000000000062695f05a68a30b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, May 26, 2020 at 4:27 PM Jan Stancek &lt;<a =
href=3D"mailto:jstancek@redhat.com" target=3D"_blank">jstancek@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><b=
r>
----- Original Message -----<br>
<br>
&gt; +<br>
&gt; +/* cgroup v1 */<br>
&gt; +#define PATH_TMP_CG1_MEM=C2=A0 =C2=A0 =C2=A0&quot;/tmp/cgroup1_mem&qu=
ot;<br>
&gt; +#define PATH_TMP_CG1_CST=C2=A0 =C2=A0 =C2=A0&quot;/tmp/cgroup1_cpuset=
&quot;<br>
<br>
It&#39;s only used for mount, so not sure if making it relative to TMPDIR<b=
r>
buys us anything.<br></blockquote><div><br></div><div><div class=3D"gmail_d=
efault" style=3D"font-size:small">I choose to use /tmp dir just because the=
 cgroup is</div><div class=3D"gmail_default" style=3D"font-size:small">moun=
ted temporarily=C2=A0for LTP test and destroyed</div><div class=3D"gmail_de=
fault" style=3D"font-size:small">after using. And I have no preference to u=
se other</div><div class=3D"gmail_default" style=3D"font-size:small">places=
(i.e. /mnt or /dev).</div></div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
<br>
&gt; +<br>
&gt; +/* cgroup v1 */<br>
&gt; +void tst_mount_cgroup1(const char *name, const char *option,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0const char *mnt_path, const char *new_path)<br>
<br>
I&#39;d make all cgroup API start with tst_cgroup*.<br></blockquote><div><b=
r></div><div><div class=3D"gmail_default" style=3D"font-size:small">Good po=
int. I agree to make the function start with that prefix.</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">The logic in this patch looks like:</div=
><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div clas=
s=3D"gmail_default" style=3D"font-size:small">tst_cgroup1_mount(...)</div><=
div class=3D"gmail_default" style=3D"font-size:small">tst_cgroup2_mount(...=
)</div><div class=3D"gmail_default" style=3D"font-size:small">// these two =
API as the basic/internal function for a different version of cgroup mounti=
ng</div><br></div><div><div class=3D"gmail_default" style=3D"font-size:smal=
l">tst_cgroup1_mem(){</div><div class=3D"gmail_default" style=3D"font-size:=
small">=C2=A0 =C2=A0 tst_cgroup1_mount(&quot;with mem para&quot;)</div><div=
 class=3D"gmail_default" style=3D"font-size:small">}</div><div class=3D"gma=
il_default" style=3D"font-size:small">tst_cgroup2_mem(){</div><div class=3D=
"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0 tst_cgroup2_mem(&qu=
ot;no need set mem, becase=C2=A0v2 has only one heierarchy&quot;)</div><div=
 class=3D"gmail_default" style=3D"font-size:small">}</div><div class=3D"gma=
il_default" style=3D"font-size:small">// these two API mount different cgro=
up=C2=A0hierarchy via tst_cgroup*_mount()</div><div class=3D"gmail_default"=
 style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"=
font-size:small">tst_cgroup_mem()</div><div class=3D"gmail_default" style=
=3D"font-size:small">{</div><div class=3D"gmail_default" style=3D"font-size=
:small">=C2=A0 =C2=A0 //if v1</div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">=C2=A0 =C2=A0 tst_cgroup1_mem()</div><div class=3D"gmail_def=
ault" style=3D"font-size:small">=C2=A0 =C2=A0 // if v2</div><div class=3D"g=
mail_default" style=3D"font-size:small">=C2=A0 =C2=A0 tst_cgroup2_mem()</di=
v><div class=3D"gmail_default" style=3D"font-size:small">}</div><div class=
=3D"gmail_default" style=3D"font-size:small">tst_cgroup_cpu()</div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">{</div><div class=3D"gmail_d=
efault" style=3D"font-size:small">=C2=A0 =C2=A0 // if v1</div><div class=3D=
"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0 tst_cgroup1_cpuset(=
);</div><div class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=
=A0 // if v2</div><div class=3D"gmail_default" style=3D"font-size:small">=
=C2=A0 =C2=A0 tst_cgroup2_cpuset(&quot;no cpuset, skip this invoke&quot;);<=
/div><div class=3D"gmail_default" style=3D"font-size:small">}</div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">// actully, we only use tst_=
cgroup_*() in testcase, they as the finial API to export to</div><br></div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Is the intent to provide API for both v1 and v2, or just higher level API<b=
r>
that hides the details?<br></blockquote><div><br></div><div><div class=3D"g=
mail_default" style=3D"font-size:small">The former. My original purpose is =
to provide unified APIs</div><div class=3D"gmail_default" style=3D"font-siz=
e:small">for both v1 and v2. Testcase author=C2=A0does not need to care</di=
v><div class=3D"gmail_default" style=3D"font-size:small">about the differen=
ce=C2=A0of two versions, if he/she want to set=C2=A0</div><div class=3D"gma=
il_default" style=3D"font-size:small">max bytes in tests, just invoke:</div=
><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div clas=
s=3D"gmail_default" style=3D"font-size:small">//in setup()</div><div class=
=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0 tst_cgroup_mem()=
</div><div class=3D"gmail_default" style=3D"font-size:small">//in main()</d=
iv><div class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0=C2=
=A0<span class=3D"gmail_default"></span>tst_cgroup_mem_set_maxbytes()</div>=
<div class=3D"gmail_default" style=3D"font-size:small">//in cleanup()</div>=
<div class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0 tst_cg=
roup_umount()</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (tst_is_mounted(mnt_path))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0SAFE_MKDIR(mnt_path, 0777);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (mount(name, mnt_path, &quot;cgroup&quot;, 0, =
option) =3D=3D -1) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (errno =3D=3D ENOD=
EV) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (rmdir(mnt_path) =3D=3D -1)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TWARN | TERRNO, &quot;rmdir %s f=
ailed&quot;, mnt_path);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0tst_brk(TCONF,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Cgroup v1 is not configured in ke=
rnel&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
We should probably handle also EBUSY, for cases when controller is already =
part<br>
of existing hierarchy. E.g. cpu,cpuacct is mounted together, and someone<br=
>
tries to mount just cpu:<br>
=C2=A0 mount(&quot;none&quot;, &quot;/mnt/cgroup&quot;, &quot;cgroup&quot;,=
 MS_MGC_VAL, &quot;cpu&quot;) =3D -1 EBUSY (Device or resource busy)<br></b=
lockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-si=
ze:small">That&#39;s true.</div><br></div><div><div class=3D"gmail_default"=
 style=3D"font-size:small">But in general, people are not permitted=C2=A0to=
 use tst_cgroup*_mount() directly, it is only as the low-level/internal fun=
ction to hide details we mount cgroup. My previous thought is that, in v1, =
cpu,cpuacct are bound together(as system way) in tst_croup_cpu().</div><br>=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +<br>
&gt; +void tst_write_memcg1(long memsz)<br>
<br>
This should at least say memmax or something similar, if we add<br>
functions for more knobs later.<br></blockquote><div><br></div><div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">Good suggestion.</div></div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I&#39;m thinking if it would be worth having API more parametrized,<br>
something like:<br></blockquote><div><br></div><div><div class=3D"gmail_def=
ault" style=3D"font-size:small">Sounds neat, we could have a try and then t=
here</div><div class=3D"gmail_default" style=3D"font-size:small">is no need=
 to export too many functions with _mem()</div><div class=3D"gmail_default"=
 style=3D"font-size:small">or _cpu() suffixes.</div><br></div><div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">I&#39;d like to merge your m=
ethod with my original basic</div><div class=3D"gmail_default" style=3D"fon=
t-size:small">functions, it seems not very hard to achieve patch v2:</div><=
br></div><div><div class=3D"gmail_default" style=3D"font-size:small">tst_cg=
roup_create(enum tst_cgroup_ctrl ctrl)</div><div class=3D"gmail_default" st=
yle=3D"font-size:small">{</div><div class=3D"gmail_default" style=3D"font-s=
ize:small">=C2=A0 =C2=A0 tst_cgroup_version();</div><div class=3D"gmail_def=
ault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" styl=
e=3D"font-size:small">=C2=A0 =C2=A0 switch(ctrl) {</div><div class=3D"gmail=
_default" style=3D"font-size:small">=C2=A0 =C2=A0 case=C2=A0<span class=3D"=
gmail_default"></span>TST_CGROUP_MEMCG:</div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">=C2=A0 =C2=A0 =C2=A0 =C2=A0 // if v1</div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
tst_cgroup1_mount(TST_CGROUP_MEMCG);</div><div class=3D"gmail_default" styl=
e=3D"font-size:small">=C2=A0 =C2=A0 =C2=A0 =C2=A0 // if v2</div><div class=
=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0 =C2=A0 =C2=A0 ts=
t_cgroup2_mount()</div><div class=3D"gmail_default" style=3D"font-size:smal=
l">=C2=A0 =C2=A0 break;</div><div class=3D"gmail_default" style=3D"font-siz=
e:small">=C2=A0 =C2=A0 case=C2=A0<span class=3D"gmail_default"></span>TST_C=
GROUP_CPUSET:</div><div class=3D"gmail_default" style=3D"font-size:small">=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 //if v1</div><div class=3D"gmail_default=
" style=3D"font-size:small">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_cgroup1_=
mount(TST_CGROUP_CPUSET);</div><div class=3D"gmail_default" style=3D"font-s=
ize:small">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// if v2</div><div class=3D"gm=
ail_default" style=3D"font-size:small">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TC=
ONF here...</div><div class=3D"gmail_default" style=3D"font-size:small">=C2=
=A0 =C2=A0 break;</div><div class=3D"gmail_default" style=3D"font-size:smal=
l">=C2=A0 =C2=A0 }</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">}</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
<br>
enum tst_cgroup_ctrl {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <span class=3D"gmail_default" style=3D"font-siz=
e:small"></span>TST_CGROUP_MEMCG =3D 1,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <span class=3D"gmail_default" style=3D"font-siz=
e:small"></span>TST_CGROUP_CPUSET =3D 2,<br>
};<br>
<br>
tst_cgroup_mount(enum tst_cgroup_ctrl)<br>
tst_cgroup_umount(enum tst_cgroup_ctrl)<br>
=C2=A0 // tests wouldn&#39;t need to use these ones directly<br>
=C2=A0 // would be probably internal functions<br>
<br>
tst_cgroup_version()<br>
=C2=A0 // to get/check cgroup support in setup()<br>
<br>
tst_cgroup_create(enum tst_cgroup_ctrl, const char *dir)<br></blockquote><d=
iv><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">Ma=
ybe we can drop the second parameter &quot;dir&quot;, the mount</div><div c=
lass=3D"gmail_default" style=3D"font-size:small">functions are internal and=
 we just use path macros in sub-function</div><div class=3D"gmail_default" =
style=3D"font-size:small">which like what I did.</div><br></div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 // mounts cgroup if not already mounted<br>
=C2=A0 // creates &quot;dir&quot;, sets up subtree_control, etc.<br>
<br>
tst_cgroup_cleanup()<br>
=C2=A0 // cleans up everything, removes dirs, umounts what was mounted<br>
<br>
tst_cgroup_move_current(enum tst_cgroup_ctrl, const char *dir)<br>
=C2=A0 // writes getpid() to dir/&quot;tasks&quot;<br>
<br>
<span class=3D"gmail_default" style=3D"font-size:small"></span>tst_cgroup_m=
em_set_maxbytes(const char *dir, long memsz)<br>
=C2=A0 // memcg specific function<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div>=
</div>

--00000000000062695f05a68a30b8--


--===============0824857774==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0824857774==--

