Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9C91ED02C
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Jun 2020 14:52:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B3CBC3C256C
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Jun 2020 14:52:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 8B85D3C2262
 for <ltp@lists.linux.it>; Wed,  3 Jun 2020 14:51:57 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id C542614016F8
 for <ltp@lists.linux.it>; Wed,  3 Jun 2020 14:51:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591188715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OrdIWIfQFCSp3E8xStFMP2HQ3a5kuaqYZ03yWd3hTcQ=;
 b=NGrbItgy5x3lcfzT2sJQ2XZ8zTMrE2wwLwTEGgJ7GrxG+SII4e2qcMBs060B9BYzmZmq52
 unoACE8vK0U1IbNM/3Hrw922b+XYngQx+r3HZBuEM8ZOuP2TFnQ0PeREtCzU9QFkH5Qllk
 F7S3x/fGojmUd7T05L0Znf1hTiCNz8o=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-BoEvfz-JP6-0R5rgo7vWIQ-1; Wed, 03 Jun 2020 08:51:51 -0400
X-MC-Unique: BoEvfz-JP6-0R5rgo7vWIQ-1
Received: by mail-lf1-f69.google.com with SMTP id k12so755566lfg.7
 for <ltp@lists.linux.it>; Wed, 03 Jun 2020 05:51:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OrdIWIfQFCSp3E8xStFMP2HQ3a5kuaqYZ03yWd3hTcQ=;
 b=LuOe4DFYXIkvspxifxmEgjCfLc9x4ujW0uGvIAH/7WRMtIuWj941l++kTup/7hXmIZ
 AYi59K6NbYXF/9vITE6KS7EzrpCzzHLPHEkBaPdfrFdC+O4rxmFJsUptz7wluSjGxesB
 H+cTrTT/WJCevWHADHCJAUCF1zmdZfqJe8AB4GVYHdzEesEuKARfmtzOrDuTmWR5fNdU
 YFr3fWc6zOpNYJEZ8zZnBKc9TaA5sAnxHwPg8+p5e7X5WUloGWmAaV5JxgqDuKYQoxKO
 xHPP/GYy+jXKkZsXpaSpgzL4l2bZkcW9pVxMOn3TMix2zvNZoWkQmXGjjY45+slhIazl
 EYJg==
X-Gm-Message-State: AOAM530uGxgnyNRsnissyFZPdAIsrUrqak5+cTgRNgpUNqfGYRnO2Bvs
 A8urL4mSUj68v7ohbNS/nhXHFB6D4AhfDJAEPbxCfhlqMUDeXHKbr0smzH25SfXt8Nutg95j4i5
 uISM0RmjFpMD73XD/7smmExdtfNA=
X-Received: by 2002:a05:6512:3329:: with SMTP id
 l9mr2357795lfe.138.1591188709653; 
 Wed, 03 Jun 2020 05:51:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjJLMwxO5ytwGN+FmxMfBghg15+wCpaRRmvpNrARvzhy8NF6M606YnOiqZg/A9ql8/uwmJZn2GuNSjMaCtVXk=
X-Received: by 2002:a05:6512:3329:: with SMTP id
 l9mr2357781lfe.138.1591188709421; 
 Wed, 03 Jun 2020 05:51:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200601100459.32511-1-liwang@redhat.com>
 <1365679659.14324910.1591019831545.JavaMail.zimbra@redhat.com>
 <CAEemH2ffNHY6Ej-Er5a4Ng_9zw+RX+wEBc0widntmYqDLNRqxw@mail.gmail.com>
 <20200602121232.GA22599@janakin.usersys.redhat.com>
 <CAEemH2d7OzG6jBZ15bYGRHm7ry-gVjzuwJYhbHp3yitB3_928w@mail.gmail.com>
 <20200603104314.GA12583@janakin.usersys.redhat.com>
In-Reply-To: <20200603104314.GA12583@janakin.usersys.redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 3 Jun 2020 20:51:37 +0800
Message-ID: <CAEemH2ey08M+-ddqh1DNWSOWSi7RNYz8ho=MSPQryYHSqamffg@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/4] lib: add new cgroup test API
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
Content-Type: multipart/mixed; boundary="===============1777051349=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1777051349==
Content-Type: multipart/alternative; boundary="000000000000cbcd2805a72d7d2c"

--000000000000cbcd2805a72d7d2c
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 3, 2020 at 6:43 PM Jan Stancek <jstancek@redhat.com> wrote:

> >> >And the worth to say, the random directory name for same cgroup
> >> >mounting is also on purpose, though we mount same(i.e memory)
> >> >cgroup in two places it still belongs to the one hierarchy, and create
> >> >the same name of the new directory will be hit an error in EEXIST.
> >> >
> >> >static void tst_cgroup_set_path(const char *cgroup_dir)
> >> >{
> >> >    ...
> >> >    sprintf(tst_cgroup_mnt_path, "%s", cgroup_dir);
> >> >    sprintf(tst_cgroup_new_path, "%s/ltp_%d", cgroup_dir, rand());
> >>
> >> I see why you are tracking this in list, but this exchange of state
> through
> >> global variables does seem bit unclear.
> >>
> >
> >Yes, that's a compromise to support more usage of the APIs.
>
> I don't get why global variables are necessary.
>

The only reason to export them as global variables is to make the legacy
read/write_cpuse_files() happy. So that I said it is a compromise.

$ git grep tst_cgroup_new_path
cpuset/cpuset01.c:      write_cpuset_files(tst_cgroup_new_path, "cpus",
buf);
cpuset/cpuset01.c:      write_cpuset_files(tst_cgroup_new_path, "mems",
mems);
cpuset/cpuset01.c:      write_cpuset_files(tst_cgroup_new_path, "mems",
buf);
cpuset/cpuset01.c:      write_cpuset_files(tst_cgroup_new_path, "mems",
buf);
lib/mem.c:      write_cpuset_files(tst_cgroup_new_path, "mems", buf);
lib/mem.c:              write_cpuset_files(tst_cgroup_new_path, "cpus",
cpus);
lib/mem.c:              write_cpuset_files(tst_cgroup_new_path, "cpus",
"0");
oom/oom04.c:            write_cpuset_files(tst_cgroup_new_path,
"memory_migrate", "1");
oom/oom05.c:            write_cpuset_files(tst_cgroup_new_path,
"memory_migrate", "1");



> tst_cgroup_mnt_path is always same as cgroup_dir parameter passed to all
> functions.
> tst_cgroup_get_path() could return pointer to tst_cgroup_pathes->new_path,
>   (you just need you call umount before del_path)
> tst_cgroup_ctl_knob is set before each use, so it could be local variable
> too.
>

tst_cgroup_ctl_knob can be localized since no other places need it.


> >I have no strong preference to shift from v2 to this method, or maybe we
> >can try
> >to combine together and do more optimize work in the lib side.
>
> Sounds like we could use 3rd opinion.
>
>

-- 
Regards,
Li Wang

--000000000000cbcd2805a72d7d2c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Jun 3, 2020 at 6:43 PM Jan Stancek &lt;<a h=
ref=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">&gt;&gt; &gt;And the =
worth to say, the random directory name for same cgroup<br>
&gt;&gt; &gt;mounting is also on purpose, though we mount same(i.e memory)<=
br>
&gt;&gt; &gt;cgroup in two places it still belongs to the one hierarchy, an=
d create<br>
&gt;&gt; &gt;the same name of the new directory will be hit an error in EEX=
IST.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;static void tst_cgroup_set_path(const char *cgroup_dir)<br>
&gt;&gt; &gt;{<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 ...<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 sprintf(tst_cgroup_mnt_path, &quot;%s&quot;, cgr=
oup_dir);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 sprintf(tst_cgroup_new_path, &quot;%s/ltp_%d&quo=
t;, cgroup_dir, rand());<br>
&gt;&gt;<br>
&gt;&gt; I see why you are tracking this in list, but this exchange of stat=
e through<br>
&gt;&gt; global variables does seem bit unclear.<br>
&gt;&gt;<br>
&gt;<br>
&gt;Yes, that&#39;s a compromise to support more usage of the APIs.<br>
<br>
I don&#39;t get why global variables are necessary.<br></blockquote><div><b=
r></div><div><div class=3D"gmail_default" style=3D"font-size:small">The onl=
y reason to export them as global variables is to make the legacy</div><div=
 class=3D"gmail_default" style=3D"font-size:small">read/write_cpuse_files()=
 happy. So that I said it is a=C2=A0compromise.</div><br></div><div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">$ git grep tst_cgroup_new_p=
ath</div>cpuset/cpuset01.c: =C2=A0 =C2=A0 =C2=A0write_cpuset_files(tst_cgro=
up_new_path, &quot;cpus&quot;, buf);<br>cpuset/cpuset01.c: =C2=A0 =C2=A0 =
=C2=A0write_cpuset_files(tst_cgroup_new_path, &quot;mems&quot;, mems);<br>c=
puset/cpuset01.c: =C2=A0 =C2=A0 =C2=A0write_cpuset_files(tst_cgroup_new_pat=
h, &quot;mems&quot;, buf);<br>cpuset/cpuset01.c: =C2=A0 =C2=A0 =C2=A0write_=
cpuset_files(tst_cgroup_new_path, &quot;mems&quot;, buf);<br>lib/mem.c: =C2=
=A0 =C2=A0 =C2=A0write_cpuset_files(tst_cgroup_new_path, &quot;mems&quot;, =
buf);<br>lib/mem.c: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_c=
puset_files(tst_cgroup_new_path, &quot;cpus&quot;, cpus);<br>lib/mem.c: =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_cpuset_files(tst_cgroup_=
new_path, &quot;cpus&quot;, &quot;0&quot;);<br>oom/oom04.c: =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0write_cpuset_files(tst_cgroup_new_path, &quot;me=
mory_migrate&quot;, &quot;1&quot;);<br><div class=3D"gmail_default" style=
=3D"font-size:small">oom/oom05.c: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
write_cpuset_files(tst_cgroup_new_path, &quot;memory_migrate&quot;, &quot;1=
&quot;);</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
tst_cgroup_mnt_path is always same as cgroup_dir parameter passed to all fu=
nctions.<br>
tst_cgroup_get_path() could return pointer to tst_cgroup_pathes-&gt;new_pat=
h,<br>
=C2=A0 (you just need you call umount before del_path)<br>
<span class=3D"gmail_default" style=3D"font-size:small"></span>tst_cgroup_c=
tl_knob is set before each use, so it could be local variable too.<br></blo=
ckquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size=
:small">tst_cgroup_ctl_knob can be localized=C2=A0since no other places nee=
d it.</div></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
<br>
&gt;I have no strong preference to shift from v2 to this method, or maybe w=
e<br>
&gt;can try<br>
&gt;to combine together and do more optimize work in the lib side.<br>
<br>
Sounds like we could use 3rd opinion.<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000cbcd2805a72d7d2c--


--===============1777051349==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1777051349==--

