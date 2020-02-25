Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A4B16BE1E
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Feb 2020 11:00:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E0A2F3C25E8
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Feb 2020 11:00:19 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id D05423C0FC4
 for <ltp@lists.linux.it>; Tue, 25 Feb 2020 11:00:17 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id C4658201289
 for <ltp@lists.linux.it>; Tue, 25 Feb 2020 11:00:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582624815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k0S4txvLb8iVdI9shSw/aTSSvmLgNU81UBzNX2aN8Ds=;
 b=il0YWV8spRJKA3qDJDrMn541cPo9ymmKUG86iQNrdCbWAOceaFWASStl5zTTnxyX7lWijq
 4cp7GT0+7Tz9EF/sM6PZn/OGiysf33L6WjbNUbqb18/GsJjBaHl3flOn4DIYEqsus8X2Dn
 0EOsvPLZSaCfLOlPrAWSJChMIBWUnyA=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-N1IwbL0GN6OmJ36N7_5KiA-1; Tue, 25 Feb 2020 05:00:12 -0500
X-MC-Unique: N1IwbL0GN6OmJ36N7_5KiA-1
Received: by mail-oi1-f200.google.com with SMTP id m127so5745077oig.19
 for <ltp@lists.linux.it>; Tue, 25 Feb 2020 02:00:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z2GqD+HyP5IQ3FkZNGf+I18fr/yjhSa7wnNkjF7z0YU=;
 b=b6zXiAvte2+zAmvAczADtZiYF2mHZJfMlEN7RXQ3NaOhmvandFXQN9a35O3hkTVWpp
 fYjTRStIYg+uXAs+rzo1DbbFSQF+IISeC2uPDmje56Kwe8NIo2plNV0bmEa9Fbc5NSaX
 E6sqYIMl9dMDHuCcihMWh1wQze8LQI15irfWeBo+TXTdvVy3k+p2dBEh1yo6kzq0vhjS
 7hsDeQBTyusK9gElUl7qcKOoQaz4/zu6lfnwSzL0QPbZPsU44wCbdaB4AjRd4PncnV0E
 4yVYftZ3O+7r67/Fa0St2dcb2CMFcEMadKiteVVjoXA+cWy+PAGMZaQomnDTJe2l5LeB
 mkaA==
X-Gm-Message-State: APjAAAUUq6xrbMhSc/AiEbHGFBoFu+j8R00Tifw0T4iVr2lYF8AaBpNX
 XdbiaZZmqaVi9+ixMihPopv0zimtDiE+uYzHwIQSYjBvVdkYEu955jHF1JlBQrVgj9k+tSx5OSB
 bM79plC76yybTdzwgeK/inXtu6OU=
X-Received: by 2002:aca:4b0f:: with SMTP id y15mr2620717oia.153.1582624811623; 
 Tue, 25 Feb 2020 02:00:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqwChzlLAqUVpcxzxfU+YzbZlaNbabOLcU+YAvhXp+OXGtjXZ3wUAm0rAIsivIQWyk8nMQbdQFeeDMFDtpGbNCE=
X-Received: by 2002:aca:4b0f:: with SMTP id y15mr2620702oia.153.1582624811358; 
 Tue, 25 Feb 2020 02:00:11 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582612624.git.viresh.kumar@linaro.org>
In-Reply-To: <cover.1582612624.git.viresh.kumar@linaro.org>
From: Li Wang <liwang@redhat.com>
Date: Tue, 25 Feb 2020 18:00:00 +0800
Message-ID: <CAEemH2dogCkDHtZzwWCx-ahg-CebGYLNyew6F2AkJVPC_yivBA@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V3 00/10] Add new LTP tests related to fsmount
 family of syscalls
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
Content-Type: multipart/mixed; boundary="===============1907430710=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1907430710==
Content-Type: multipart/alternative; boundary="000000000000b1bb5e059f638d79"

--000000000000b1bb5e059f638d79
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Viresh,

These new tests look good, only a few comments/questions below:

Patch 1/10:
1. The git summary should be updated too (someone who push patch can help
do that:).
2. Maybe better to replace the TWARN by TINFO? Since tst_is_mounted() as a
general function to check if mount success, sometimes we just need the
return status then do next work(I tend to leave the waring or break operate
to LTP users:).

Patch 5/10, 9/10:
May I ask why we use "sync" as the key value in fsconfig()? I ask this
because it can get rid of the errors we found in XFS test before.

Patch 9/10, 10/10:
I guess that'd be better if we put the 'ismounted =3D 1' at the behind of
tst_is_mounted(), do you feel the code sequence looks strange which we set
'ismounted' to 1 then do mount checking?

Ack for the whole patchset v3 (+ follow some modification for above
comments):
    Acked-by: Li Wang <liwang@redhat.com>

--=20
Regards,
Li Wang

--000000000000b1bb5e059f638d79
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi=C2=A0Viresh,</div><div class=3D"gmail_default" style=3D"fo=
nt-size:small"><br></div></div><div><div class=3D"gmail_default" style=3D"f=
ont-size:small">These new tests look good, only a few comments/questions be=
low:</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div>=
<div class=3D"gmail_default" style=3D"font-size:small">Patch 1/10:</div><di=
v class=3D"gmail_default" style=3D"font-size:small">1. The git summary shou=
ld be updated too (someone who push patch can help do that:).</div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">2. Maybe better to replace t=
he TWARN by TINFO? Since tst_is_mounted() as a general function to check if=
 mount success, sometimes we just need the return status then=C2=A0do next =
work(I tend to leave the waring or break operate to LTP users:).</div><div =
class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"g=
mail_default" style=3D"font-size:small">Patch 5/10, 9/10:=C2=A0</div><div c=
lass=3D"gmail_default" style=3D"font-size:small">May I ask why we use &quot=
;sync&quot; as the key value in fsconfig()? I ask this because=C2=A0it can =
get rid of the errors we found in XFS test before.</div><div class=3D"gmail=
_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default" =
style=3D"font-size:small">Patch 9/10, 10/10:</div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">I guess that&#39;d be better if we put the &#=
39;ismounted =3D 1&#39; at the behind of tst_is_mounted(), do you feel the =
code=C2=A0sequence looks strange which we set &#39;ismounted&#39; to 1 then=
 do mount checking?</div><div class=3D"gmail_default" style=3D"font-size:sm=
all"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Ack f=
or the whole patchset v3 (+ follow some modification=C2=A0for above comment=
s):=C2=A0</div><div class=3D"gmail_default" style=3D"font-size:small">=C2=
=A0 =C2=A0 Acked-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" targe=
t=3D"_blank">liwang@redhat.com</a>&gt;</div><br></div>-- <br><div dir=3D"lt=
r"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></di=
v></div>

--000000000000b1bb5e059f638d79--


--===============1907430710==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1907430710==--

