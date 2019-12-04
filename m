Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB50112741
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Dec 2019 10:27:22 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 463C33C2513
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Dec 2019 10:27:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 4A3873C2477
 for <ltp@lists.linux.it>; Wed,  4 Dec 2019 10:27:17 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 811A2209D34
 for <ltp@lists.linux.it>; Wed,  4 Dec 2019 10:27:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575451634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mTPhqKFCMoq0RE8B/bZ/+VboLeluqZt7mIUzJ/ekvJY=;
 b=br2igavxUJnSFPmpyfR6j3uFV9DQzeTjLRGBVOCuQvDZO/WcS4jXN28VhSInnZ5q7Yhit0
 yMy7NST9mzJ3z0QR3hUXaUkybxrYxik8WUZyxb0plT5/VB7nLJ4yLYbLn6rcYVoehXC4Hu
 zxhM7T+epr41lEjHsJpGF2C2YSpQ4yc=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-H7SsJfgBN6-zQemSSXwYGg-1; Wed, 04 Dec 2019 04:27:11 -0500
Received: by mail-oi1-f198.google.com with SMTP id y7so3323592oie.13
 for <ltp@lists.linux.it>; Wed, 04 Dec 2019 01:27:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yzz8EkLMUnEMeoAMFbx4luGYYHpFrfNqmiRtWcaFXqM=;
 b=WfJh9no4JdzUPTdctg+oRL4g2mLN9TvMQPwyi/NVU3eUWU6kX4PJfUi69PV5bdhFUU
 3i0FssoZbXopca1Y4Y0WvSA60GfDl2s4mhvGydPFbn2JA+D/2oUEsRF7LAQQOJXIP8Bm
 wcnZrWjKjlX3jHVapHrv44hvS4Q+hdb/i1XaneSIy4hLYtWcErlZha3tubDudTtFV/b3
 RliK0sXMf6yS6Oq1QOgm5PMnRWSx8L+vx6ISygHLyxB80ueZ60Uy76rV8/NgTSVScgOs
 uQO2H0iVikIgquoW/rz/ptJx3blz9zdKexk0Ore2i3KHAEMUeDlk5PCClJwY4zJC4Wby
 i7dg==
X-Gm-Message-State: APjAAAUqW50erb7Wg3nLmEdS+7Z51o+IZD6VobZtTfQSH/zhWthEluPz
 gUoW7HC+0gp1UsavUoJU6vcBSmFgVBi8kFMTOqC72EYzCFGYnycj5U9WZUo4scNbESue/lNxJFj
 PRZy28EHlK4MEcAdLfuldxfquqV8=
X-Received: by 2002:aca:aad8:: with SMTP id t207mr1669971oie.138.1575451630411; 
 Wed, 04 Dec 2019 01:27:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqwFTnA8wjlfZkA6fyqvyH5sgICGIONgoQ7aSHoLQ+7NfkqI+TDuWdzKhA9xUd9r1BgxEUFweqE+dqOKMU2+X5Y=
X-Received: by 2002:aca:aad8:: with SMTP id t207mr1669968oie.138.1575451630200; 
 Wed, 04 Dec 2019 01:27:10 -0800 (PST)
MIME-Version: 1.0
References: <20191128084506.7587-1-liwang@redhat.com>
 <20191203104917.GA2844@rei>
 <CAEemH2d0KJ_oi7j5sjcT=uUo28crB_hCs-gJzvWhczvKOG-mdA@mail.gmail.com>
In-Reply-To: <CAEemH2d0KJ_oi7j5sjcT=uUo28crB_hCs-gJzvWhczvKOG-mdA@mail.gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 4 Dec 2019 17:26:59 +0800
Message-ID: <CAEemH2doR7C6J4ROgLw=cJsWfH2-6y8-YwDwdGM8coH6ovM6_Q@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-MC-Unique: H7SsJfgBN6-zQemSSXwYGg-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.6 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,PDS_BTC_ID,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] lib: add tst_request_hugepages
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
Content-Type: multipart/mixed; boundary="===============0826915313=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0826915313==
Content-Type: multipart/alternative; boundary="000000000000c787c10598dd6a27"

--000000000000c787c10598dd6a27
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 4, 2019 at 2:40 PM Li Wang <liwang@redhat.com> wrote:

> ...
> if the .needs_hugepages is set to an expected number, we should verify
> strictly if the system can provide that.
>

Oh, I guess maybe I misunderstand your suggestion here. you mean just to
let .needs_hugepages =3D 1 but not set an expected number, right? if so, th=
at
will more easy to achieve.


>
>> Also this fails to cleanup after itself, we have to restore the system
>> after the test, which is one more reason why we need .needs_hugepages in
>> the tst_test structure because the test library can cleanup after the
>> test with that.
>>
>
> Agree, I will add the save/restore part for this.
>

Or just go with .save_restore in the testcase?

--=20
Regards,
Li Wang

--000000000000c787c10598dd6a27
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div cl=
ass=3D"gmail_default" style=3D"font-size:small"><br></div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 4, 20=
19 at 2:40 PM Li Wang &lt;<a href=3D"mailto:liwang@redhat.com">liwang@redha=
t.com</a>&gt; wrote:</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">..=
.</div><div class=3D"gmail_quote"><div><div style=3D"font-size:small">if th=
e=C2=A0.needs_hugepages is set to an expected number, we should verify stri=
ctly if the system can provide that.</div></div></div></div></blockquote><d=
iv><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">Oh=
, I guess maybe I misunderstand your suggestion here. you mean just to let =
.needs_hugepages =3D 1 but not set an expected number, right? if so, that w=
ill more easy to achieve.</div></div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Also this fails to cleanup after itself, we have to restore the system<br>
after the test, which is one more reason why we need .needs_hugepages in<br=
>
the tst_test structure because the test library can cleanup after the<br>
test with that.<br></blockquote><div><br></div></div><div style=3D"font-siz=
e:small">Agree, I will add the save/restore part for this.</div></div></blo=
ckquote><div><br></div><div class=3D"gmail_default" style=3D"font-size:smal=
l">Or just go with .save_restore in the testcase?=C2=A0</div></div><div><br=
></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><=
div>Regards,<br></div><div>Li Wang<br></div></div></div></div></div></div>

--000000000000c787c10598dd6a27--


--===============0826915313==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0826915313==--

