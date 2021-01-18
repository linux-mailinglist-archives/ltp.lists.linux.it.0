Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 381292F9D78
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Jan 2021 12:05:09 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BEBF33C5822
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Jan 2021 12:05:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id A745F3C30C8
 for <ltp@lists.linux.it>; Mon, 18 Jan 2021 12:05:04 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 4FF041400218
 for <ltp@lists.linux.it>; Mon, 18 Jan 2021 12:05:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610967901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1Mv9+qk3K8EHy/7h31d/nk/k3Ump2qXnWwJJqH/UE+o=;
 b=EW+pEYHK3XtjrrXyPVr3giGXAeYY62ZZOl1WAYVU5XwTiIG/sRwTO/NMjrIoy3QaGRQ0lG
 vuL8fH1YUsbz1EuEb1jRC1rtyyXmo8WNn0v7immjOqYowF3kh7UDgn5uMVIWX2kxJLrX9L
 67pUQEowRS3pmj1fEH/3OmnqE5RbqUE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-G6wUCbN-NIWsvX-dFUOr7A-1; Mon, 18 Jan 2021 06:04:59 -0500
X-MC-Unique: G6wUCbN-NIWsvX-dFUOr7A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3BDB8030A3;
 Mon, 18 Jan 2021 11:04:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7318560622;
 Mon, 18 Jan 2021 11:04:58 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 32D4018095C7;
 Mon, 18 Jan 2021 11:04:57 +0000 (UTC)
Date: Mon, 18 Jan 2021 06:04:57 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: liuxp11@chinatelecom.cn
Message-ID: <830441383.33482781.1610967897529.JavaMail.zimbra@redhat.com>
In-Reply-To: <202101181134453606602@chinatelecom.cn>
References: <1610672031-5044-1-git-send-email-liuxp11@chinatelecom.cn>
 <95241263.33332311.1610722445185.JavaMail.zimbra@redhat.com>
 <202101181134453606602@chinatelecom.cn>
MIME-Version: 1.0
X-Originating-IP: [10.36.110.76, 10.4.195.18]
Thread-Topic: fs/proc01.c:add known issues
Thread-Index: T90FGcrko2e+ckoN2ez5LizRgNRJFQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,
 T_KAM_HTML_FONT_INVALID autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] fs/proc01.c:add known issues
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
Cc: ltp <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1920044126=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1920044126==
Content-Type: multipart/alternative; 
	boundary="----=_Part_33482780_1667872582.1610967897528"

------=_Part_33482780_1667872582.1610967897528
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

----- Original Message -----

> thanks for good question.

> i check the source linux-source-5.8.0,in filesecurity/smack/smack_lsm.c:
> smack_getprocattr
> directly return -EINVAL.

> static int smack_getprocattr(struct task_struct *p, char *name, char **value)
> {
> struct smack_known *skp = smk_of_task_struct(p);
> char *cp;
> int slen;

> if (strcmp(name, "current") != 0 && strcmp(name, "context") != 0)
> return -EINVAL;

That doesn't look correct, strcmp when reading "current" returns 0, so you condition above 
shouldn't be hit. 

I'm guessing you don't have smack enabled, and EINVAL is the default LSM ret value 
in such case: 

LSM_HOOK(int, -EINVAL, getprocattr, struct task_struct *p, char *name, 
char **value) 

int security_getprocattr(struct task_struct *p, const char *lsm, char *name, 
char **value) 
{ 
struct security_hook_list *hp; 

hlist_for_each_entry(hp, &security_hook_heads.getprocattr, list) { 
if (lsm != NULL && strcmp(lsm, hp->lsm)) 
continue; 
return hp->hook.getprocattr(p, name, value); 
} 
return LSM_RET_DEFAULT(getprocattr); 
} 

> cp = kstrdup(skp->smk_known, GFP_KERNEL);
> if (cp == NULL)
> return -ENOMEM;

> slen = strlen(cp);
> *value = cp;
> return slen;
> }

> > From: Jan Stancek
> 
> > Date: 2021-01-15 22:54
> 
> > To: Xinpeng Liu
> 
> > CC: ltp
> 
> > Subject: Re: [LTP] [PATCH] fs/proc01.c:add known issues
> 
> > ----- Original Message -----
> 
> > > Test in ubuntu20.10,there are several failure tests.
> 
> > >
> 
> > > proc01 1 TFAIL : proc01.c:396: read failed:
> 
> > > /proc/self/task/61595/attr/smack/current: errno=EINVAL(22): Invalid
> > > argument
> 
> > > proc01 2 TFAIL : proc01.c:396: read failed:
> 
> > > /proc/self/task/61595/attr/apparmor/prev: errno=EINVAL(22): Invalid
> > > argument
> 
> > > proc01 3 TFAIL : proc01.c:396: read failed:
> 
> > > /proc/self/task/61595/attr/apparmor/exec: errno=EINVAL(22): Invalid
> > > argument
> 
> > > proc01 4 TFAIL : proc01.c:396: read failed:
> 
> > > /proc/self/attr/smack/current: errno=EINVAL(22): Invalid argument
> 
> > > proc01 5 TFAIL : proc01.c:396: read failed:
> 
> > > /proc/self/attr/apparmor/prev: errno=EINVAL(22): Invalid argument
> 
> > > proc01 6 TFAIL : proc01.c:396: read failed:
> 
> > > /proc/self/attr/apparmor/exec: errno=EINVAL(22): Invalid argument
> 
> > I'm OK with ignoring it, but commit log could explain more why we get
> > EINVAL
> 
> > on read here.
> 

------=_Part_33482780_1667872582.1610967897528
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"font-family: times new roman, new york, times, se=
rif; font-size: 12pt; color: #000000"><div><br></div><hr id=3D"zwchr"><bloc=
kquote style=3D"border-left:2px solid #1010FF;margin-left:5px;padding-left:=
5px;color:#000;font-weight:normal;font-style:normal;text-decoration:none;fo=
nt-family:Helvetica,Arial,sans-serif;font-size:12pt;"><style>body { line-he=
ight: 1.5; }blockquote { margin-top: 0px; margin-bottom: 0px; margin-left: =
0.5em; }body { font-size: 14px; font-family: 'Microsoft YaHei UI'; color: r=
gb(0, 0, 0); line-height: 1.5; }</style><div>thanks for good question.</div=
><div><br></div><div>i check the source linux-source-5.8.0,in filesecurity/=
smack/smack_lsm.c:<span style=3D"line-height: 1.5; background-color: transp=
arent;">smack_getprocattr</span></div><div>directly return&nbsp;<b style=3D=
"line-height: 1.5; background-color: transparent;">-EINVAL.</b></div><div><=
br></div><div><div>static int smack_getprocattr(struct task_struct *p, char=
 *name, char **value)</div><div>{</div><div>&nbsp; &nbsp; &nbsp; &nbsp; str=
uct smack_known *skp =3D smk_of_task_struct(p);</div><div>&nbsp; &nbsp; &nb=
sp; &nbsp; char *cp;</div><div>&nbsp; &nbsp; &nbsp; &nbsp; int slen;</div><=
div><br></div><div><b>&nbsp; &nbsp; &nbsp; &nbsp; if (strcmp(name, "current=
") !=3D 0 &amp;&amp; strcmp(name, "context") !=3D 0)</b></div><div><b>&nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return -EINVAL;</b></div=
></div></blockquote><div><br></div><div>That doesn't look correct, strcmp w=
hen reading "current" returns 0, so you condition above<br></div><div>shoul=
dn't be hit.<br></div><div><br></div><div>I'm guessing you don't have smack=
 enabled, and EINVAL is the default LSM ret value<br></div><div>in such cas=
e:<br></div><div><br></div><div><strong>LSM_HOOK(int, -EINVAL, getprocattr,=
 struct task_struct *p, char *name,</strong><br><strong>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char **value)</strong></div><div><br></div><d=
iv>int security_getprocattr(struct task_struct *p, const char *lsm, char *n=
ame,<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char **value)<br>{<br>&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct security_hook_list *hp;<br><br>&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hlist_for_each_entry(hp, &amp;secu=
rity_hook_heads.getprocattr, list) {<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (lsm !=3D NULL &=
amp;&amp; strcmp(lsm, hp-&gt;lsm))<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return hp-&gt;hook.=
getprocattr(p, name, value);<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
}<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>return LSM_RET_DEFA=
ULT(getprocattr);</strong><br>}</div><div><br></div><blockquote style=3D"bo=
rder-left:2px solid #1010FF;margin-left:5px;padding-left:5px;color:#000;fon=
t-weight:normal;font-style:normal;text-decoration:none;font-family:Helvetic=
a,Arial,sans-serif;font-size:12pt;"><div><br></div><div><div>&nbsp; &nbsp; =
&nbsp; &nbsp; cp =3D kstrdup(skp-&gt;smk_known, GFP_KERNEL);</div><div>&nbs=
p; &nbsp; &nbsp; &nbsp; if (cp =3D=3D NULL)</div><div>&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return -ENOMEM;</div><div><br></div><div=
>&nbsp; &nbsp; &nbsp; &nbsp; slen =3D strlen(cp);</div><div>&nbsp; &nbsp; &=
nbsp; &nbsp; *value =3D cp;</div><div>&nbsp; &nbsp; &nbsp; &nbsp; return sl=
en;</div><div>}</div></div><div><br></div><div><br></div><blockquote style=
=3D"margin-Top: 0px; margin-Bottom: 0px; margin-Left: 0.5em; margin-Right: =
inherit"><div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3=
.0pt 0cm 0cm 0cm"><div style=3D"PADDING-RIGHT: 8px; PADDING-LEFT: 8px; FONT=
-SIZE: 12px;FONT-FAMILY:tahoma;COLOR:#000000; BACKGROUND: #efefef; PADDING-=
BOTTOM: 8px; PADDING-TOP: 8px"><div><b>From:</b><a href=3D"mailto:jstancek@=
redhat.com" target=3D"_blank">Jan Stancek</a><br data-mce-bogus=3D"1"></div=
><div><b>Date:</b>&nbsp;2021-01-15&nbsp;22:54</div><div><b>To:</b><a href=
=3D"mailto:liuxp11@chinatelecom.cn" target=3D"_blank">Xinpeng Liu</a><br da=
ta-mce-bogus=3D"1"></div><div><b>CC:</b><a href=3D"mailto:ltp@lists.linux.i=
t" target=3D"_blank">ltp</a><br data-mce-bogus=3D"1"></div><div><b>Subject:=
</b>&nbsp;Re: [LTP] [PATCH] fs/proc01.c:add known issues</div></div></div><=
div><div>----- Original Message -----</div><div>&gt; Test in ubuntu20.10,th=
ere are several failure tests.</div><div>&gt; </div><div>&gt; proc01&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; 1&nbsp; TFAIL&nbsp; :&nbsp; proc01.c:396: read fail=
ed:</div><div>&gt; /proc/self/task/61595/attr/smack/current: errno=3DEINVAL=
(22): Invalid argument</div><div>&gt; proc01&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
2&nbsp; TFAIL&nbsp; :&nbsp; proc01.c:396: read failed:</div><div>&gt; /proc=
/self/task/61595/attr/apparmor/prev: errno=3DEINVAL(22): Invalid argument</=
div><div>&gt; proc01&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3&nbsp; TFAIL&nbsp; :&nb=
sp; proc01.c:396: read failed:</div><div>&gt; /proc/self/task/61595/attr/ap=
parmor/exec: errno=3DEINVAL(22): Invalid argument</div><div>&gt; proc01&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; 4&nbsp; TFAIL&nbsp; :&nbsp; proc01.c:396: read f=
ailed:</div><div>&gt; /proc/self/attr/smack/current: errno=3DEINVAL(22): In=
valid argument</div><div>&gt; proc01&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5&nbsp; =
TFAIL&nbsp; :&nbsp; proc01.c:396: read failed:</div><div>&gt; /proc/self/at=
tr/apparmor/prev: errno=3DEINVAL(22): Invalid argument</div><div>&gt; proc0=
1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6&nbsp; TFAIL&nbsp; :&nbsp; proc01.c:396: r=
ead failed:</div><div>&gt; /proc/self/attr/apparmor/exec: errno=3DEINVAL(22=
): Invalid argument</div><div>I'm OK with ignoring it, but commit log could=
 explain more why we get EINVAL</div><div>on read here.</div></div></blockq=
uote></blockquote><div><br></div></div></body></html>
------=_Part_33482780_1667872582.1610967897528--


--===============1920044126==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1920044126==--

