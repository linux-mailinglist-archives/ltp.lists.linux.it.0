Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1235D3102F8
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Feb 2021 03:49:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CDE503C7359
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Feb 2021 03:49:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 6DC2A3C309C
 for <ltp@lists.linux.it>; Fri,  5 Feb 2021 03:49:01 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 195F41A0109B
 for <ltp@lists.linux.it>; Fri,  5 Feb 2021 03:49:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612493339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k6pRWMiviNdoj0745/qKelAwIOsXWAgCl1NyVmnTDuI=;
 b=La3WIMx7+5SAAJuoClzrKFDqkgjtN9X+m4v9RaCUvh5tS71WLvf7Jn3qYC4WsMxSOf5ZRs
 tTEurw30Et+shybohJztIKRscp5S1mmpqXr+pAwNp2zE0jzlQ8gQG5KQIo/ITDzhZGetx1
 ABGvHKK90RjtuF8/dRKzaoMp42kC9Yo=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-Pf1LSzmtM1CNmeu8vpF7hg-1; Thu, 04 Feb 2021 21:48:57 -0500
X-MC-Unique: Pf1LSzmtM1CNmeu8vpF7hg-1
Received: by mail-yb1-f199.google.com with SMTP id p22so5335768ybc.18
 for <ltp@lists.linux.it>; Thu, 04 Feb 2021 18:48:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k6pRWMiviNdoj0745/qKelAwIOsXWAgCl1NyVmnTDuI=;
 b=qJ28bQLeWzQ36Th6Beo2VoYHXuNMdng8XeB6sXryz786Xj9nY3KWcwXS8MlF6Y2Jx9
 T3yMg9dHspT01/GhRO/ARspTuqjh5fMlgiBWynv6OgBnh8Gl12rUNnE4zwIL/SCc3wUM
 QOKfq0Nr421cpJmP8rgucRqYausut5D5XFKEac/3Ip14traahkx2x8i/e318/TeC9hTE
 bqt4j8EunIO9xfvFj5RItCv2jtBuaTeEq3u13Iocuc9TCzXKuL9yD25pa0HnxTJUQorY
 V8Rmoa6h+/HThN0RCE3PZuvYCN3MItZKcANx+Z1sXW9oGPg7DC9wZ3mFZWGeZHL7S+TC
 wWPA==
X-Gm-Message-State: AOAM530lp5dYlP06BZuQLxMsjI4tQBtVjRPwra8w40UlfWAbdxhMw7BA
 gyhQKLd64msOMLG3P3xVXprnN8FWN7XmiIiUPycOm2nqvF7T811Hq0rO2JUN2PvD8EAhKQSHZHw
 AU9as6gPk33mLM4kUuDnTTj3ze4g=
X-Received: by 2002:a25:4b86:: with SMTP id y128mr3188891yba.403.1612493337140; 
 Thu, 04 Feb 2021 18:48:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyDkIqZhfgAErVacumG4Cm0mY2ji9obtPcym/hQpdtxcYqRAd09eCPf8ZacZi8nn8yyeTSN2850I6qKc3ae1pU=
X-Received: by 2002:a25:4b86:: with SMTP id y128mr3188879yba.403.1612493336926; 
 Thu, 04 Feb 2021 18:48:56 -0800 (PST)
MIME-Version: 1.0
References: <20210205011635.177469-1-zhaogongyi@huawei.com>
In-Reply-To: <20210205011635.177469-1-zhaogongyi@huawei.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 5 Feb 2021 10:48:45 +0800
Message-ID: <CAEemH2fiJptNGoL0-mA6oPyYmhRvUqOK2rzveF=--QnQt1HCNQ@mail.gmail.com>
To: zhao gongyi <zhaogongyi@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] ttype: using TERRNO to macth errno
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
Content-Type: multipart/mixed; boundary="===============0063185543=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0063185543==
Content-Type: multipart/alternative; boundary="0000000000008cf58205ba8ddc62"

--0000000000008cf58205ba8ddc62
Content-Type: text/plain; charset="UTF-8"

Hi Gongyi,

Any possibility of finding a way to correct all of the unprecise res-flags
in LTP tests?

-- 
Regards,
Li Wang

--0000000000008cf58205ba8ddc62
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Gongyi,</div><div class=3D"gmail_default" style=3D"font-si=
ze:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">=
Any possibility of finding a way to correct all of the unprecise res-flags =
in LTP tests?</div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gm=
ail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></di=
v></div></div></div>

--0000000000008cf58205ba8ddc62--


--===============0063185543==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0063185543==--

