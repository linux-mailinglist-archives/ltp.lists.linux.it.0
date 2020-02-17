Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B2C160DD4
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 09:54:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B0F393C23EC
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 09:54:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id E9DD53C23C3
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 09:54:41 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 5ABDE14013A0
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 09:54:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581929679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8lrxcBhmROvZZM4+QCtPFIutsa7FQPoQN9F55Nnx820=;
 b=jSLZzmAdOscGP8i438AbbiqHQm6bYuDMT1ZunN26fAE7SQ83MfooVxJQxRVbRSM+hpUfZb
 PJo4bEXVSSOZvsMSJRmPbDxtSIYFS+2Qp+5ekJsBDDOXQpDlA/b1D2bQwJVLt2kBY0NxUz
 5B+k+8f1BdFc2TnXoeufBjQt77qJxUc=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-M1LecBPFOMODCj4jpWX3bA-1; Mon, 17 Feb 2020 03:54:35 -0500
Received: by mail-ot1-f69.google.com with SMTP id d16so10174626otp.10
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 00:54:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8HhD+KIAKkNp6jOmhpCyRXl45Ym36YDtAMPQHfAG6k4=;
 b=BaZCmomXv6JOdYn9JGtFoe6xC9ogXr/OR4bvmxdJeChftzRR/p+Seb5vH0OC0ATP/s
 Da0c7tl5BWFfiJV1seUkYVOBWdX6YRrRE5PvnIRqEnVJ02+t0VQl1SCYQziMVmOHeY5K
 GiA4VJyXEe6b1z4Nj8auiZ3PmAKGa+yAea/fnR7t/3GRNvSyzq5EwUL4CdsMMN7n0k0a
 G0LzyztsZtXcPqL3Vx7MNGEEGXdmGWcXDA/dpRQ1Dt7ZMKopLXrv543ByXAzOS+v9GIR
 zNpjnnap16h4Zt1e9kI4SMjb0q1q+lMAElkHflEG63k3/XIjbol9Mt+Kr5EUUypQ6lQX
 P5MQ==
X-Gm-Message-State: APjAAAV5udBsadc3UNtNT6P6uhuzzaPnyyUO9tznMC/f+4kX7ClYUpvq
 6BSGVZEUheP+DkXhKwdNLobVNsLxh2XfMXViztIL/x3cJgNuZe5CPmhrkiro7HlvBibf7ovaRUv
 r/62wjtD1jx1o0SOJEVn+g3MhHeM=
X-Received: by 2002:aca:1913:: with SMTP id l19mr8787840oii.47.1581929674878; 
 Mon, 17 Feb 2020 00:54:34 -0800 (PST)
X-Google-Smtp-Source: APXvYqxJfTXazZh6DPp9TiYJbOZA3H/FSepvpCJLEhWBRN8VVRUh+YcCghiKDRrFjQXVBnj3C/YBBltUJNwU/h1hwmc=
X-Received: by 2002:aca:1913:: with SMTP id l19mr8787825oii.47.1581929674630; 
 Mon, 17 Feb 2020 00:54:34 -0800 (PST)
MIME-Version: 1.0
References: <cover.1581680021.git.viresh.kumar@linaro.org>
 <1c61c673a02152c30edac0e25438257c23c3322e.1581680021.git.viresh.kumar@linaro.org>
 <CAEemH2f2pR1KhLAoKKphzh9fP++yyALbv4TiAh=4Vyv0M3SEdw@mail.gmail.com>
 <20200217082931.vbjkg2f53lek4uf3@vireshk-i7>
In-Reply-To: <20200217082931.vbjkg2f53lek4uf3@vireshk-i7>
From: Li Wang <liwang@redhat.com>
Date: Mon, 17 Feb 2020 16:54:23 +0800
Message-ID: <CAEemH2c28zj-+pec+sgoLzCq6iV627YvyH2hRpQN98eYZ_8geg@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-MC-Unique: M1LecBPFOMODCj4jpWX3bA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4/7] syscalls/fsmount: New tests
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
Cc: Vikas.Kumar2@arm.com, Vincent Guittot <vincent.guittot@linaro.org>,
 LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0819914891=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0819914891==
Content-Type: multipart/alternative; boundary="0000000000005103d8059ec1b4e8"

--0000000000005103d8059ec1b4e8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 17, 2020 at 4:29 PM Viresh Kumar <viresh.kumar@linaro.org>
wrote:

> ...
> > Adding #include "lapi/fcntl.h" in case of =E2=80=98AT_FDCWD=E2=80=99 un=
declared. It seems
> > we have to do this for all the tests involves  =E2=80=98AT_FDCWD=E2=80=
=99.
>
> my fsmount.h header includes <fcntl.h>, won't that be enough ?
>

I'm afraid it's not enough.

After having a closer look, the reason is that the AT_FDCWD is defined with
condition __USE_ATFILE,  the __USE_ATFILE depends on _ATFILE_SOURCE
defined, and _ATFILE_SOURCE needs enable _GNU_SOURCE.

So another effective way is to add '#define _GNU_SOURCE' in front of your
test then that <fcntl.h> will be work for you.

# rpm -qa glibc-headers
glibc-headers-2.5-123

# cat /usr/include/fcntl.h |grep AT_FDCWD -B 2 -A 2
#ifdef __USE_ATFILE
# define AT_FDCWD -100   /* Special value used to indicate
                                                the *at functions should
use the
                                                current working directory.
*/


--=20
Regards,
Li Wang

--0000000000005103d8059ec1b4e8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Feb 17, 2020 at 4:29 PM Viresh Kumar &lt;<a=
 href=3D"mailto:viresh.kumar@linaro.org">viresh.kumar@linaro.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span class=
=3D"gmail_default" style=3D"font-size:small">...</span><br>
&gt; Adding #include &quot;lapi/fcntl.h&quot; in case of =E2=80=98AT_FDCWD=
=E2=80=99 undeclared. It seems<br>
&gt; we have to do this for all the tests involves=C2=A0 =E2=80=98AT_FDCWD=
=E2=80=99.<br>
<br>
my fsmount.h header includes &lt;fcntl.h&gt;, won&#39;t that be enough ?<br=
></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"fon=
t-size:small">I&#39;m afraid it&#39;s not enough.=C2=A0</div><div class=3D"=
gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">After having a closer look, the reason is th=
at the AT_FDCWD is defined with condition __USE_ATFILE,=C2=A0 the __USE_ATF=
ILE depends on _ATFILE_SOURCE defined, and _ATFILE_SOURCE needs enable=C2=
=A0_GNU_SOURCE.</div><div class=3D"gmail_default" style=3D"font-size:small"=
><br></div><div class=3D"gmail_default" style=3D"font-size:small">So anothe=
r effective way is to add &#39;#define _GNU_SOURCE&#39; in front of your te=
st then that &lt;fcntl.h&gt; will be work for you.</div><div class=3D"gmail=
_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default" =
style=3D"font-size:small"># rpm -qa glibc-headers<br>glibc-headers-2.5-123<=
br></div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small"># cat /usr/include/fc=
ntl.h |grep AT_FDCWD -B 2 -A 2</div><div class=3D"gmail_default" style=3D"f=
ont-size:small">#ifdef __USE_ATFILE<br># define AT_FDCWD=09=09-100=C2=A0 =
=C2=A0/* Special value used to indicate</div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 the *at functions should use =
the<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 current working directory. */<br></div></div><d=
iv><br></div><div><br></div><div>--=C2=A0</div></div><div dir=3D"ltr" class=
=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<b=
r></div></div></div></div>

--0000000000005103d8059ec1b4e8--


--===============0819914891==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0819914891==--

