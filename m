Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A591D7207
	for <lists+linux-ltp@lfdr.de>; Mon, 18 May 2020 09:39:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DF5D63C4F0B
	for <lists+linux-ltp@lfdr.de>; Mon, 18 May 2020 09:39:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 1A1883C2078
 for <ltp@lists.linux.it>; Mon, 18 May 2020 09:39:49 +0200 (CEST)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B1FB16013A4
 for <ltp@lists.linux.it>; Mon, 18 May 2020 09:39:48 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id k5so2130236lji.11
 for <ltp@lists.linux.it>; Mon, 18 May 2020 00:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=Dv+IzlZlXSCt2ACoRAk/ub/Dfm5HcODDWQXtLAnnsig=;
 b=HnKrddG8MYGqOkkks8jbD/JZJw7xk8twcg/UHr3ZZfuvahAH2sGjMHuJny3yA2i9qZ
 J3kQiu7vn2L7QVbRr/wyunMvs8C4fIskeRdP343EFol0O7NzOemuQsNdml9QZAwJl3cF
 5xHpkjb6Wq3NzbSp4/okfkMP73HJrAgrBZ6PPEKG7UchCtP/Q1afNMd+d5usr2OVDUge
 /vmtHGy3ID/m3tEAQBoDSeW7Qp4hCrB57/RkrUfCHaIV25eHv0f7ob8pgsggzHRUFEpO
 t+w4jjGnpDiaVMhXlIzQQzw/8zifZ21w3mEmMExQ8joZmuFCQ3WBN/KowIxAXRrhZTuK
 qguA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=Dv+IzlZlXSCt2ACoRAk/ub/Dfm5HcODDWQXtLAnnsig=;
 b=SsaUgaT2q/nvj9oQtNstgOyKGsqtM68rSNlQqzq/74C1RN6DHCMvxRrn4o91J/ymZ4
 7u/We9JICgJqtrtRXBhcCZpSPPoqrzD3xZqMGi5nhCkretybs/MXVvfKWDa5kLAduanc
 +dzlTyT3S/4pm20yrDIiPfCFw9p4Yjo/INkrSstw80Vbkuw7Esqt/CG86419vQ+7YYfU
 kGthT1m/hBnIPUv5Y1uXIB18LjT/oBTf8YIFYV7BW0ICFA+kRdlImsU3STy65Tm1llZU
 WSX89+YlPWuqofBW3lUji+u0EUgiJkGPrARbrwXhaSYQLPGQMf3LrQjqHt5wM8kf99O8
 YTQg==
X-Gm-Message-State: AOAM531zN/byaLOFuUInQYFK4YDwEWDD/PMvyU9pMgKa6lHpDMlfdqaf
 3lsf23T1yf9HsrD1eS+nttzu7znPMAFjaE73Fub3BFSrAT0=
X-Google-Smtp-Source: ABdhPJx/K00edpco++ncC+GZgN9jTkjwnqXOfL2AUIkTtcWmSkxEE66j+H4gWHHQqNT219M8hNGbCOjNcnkiFrgJHZs=
X-Received: by 2002:a2e:a48d:: with SMTP id h13mr4902177lji.120.1589787587527; 
 Mon, 18 May 2020 00:39:47 -0700 (PDT)
MIME-Version: 1.0
From: Aaron Chou <zhoubb.aaron@gmail.com>
Date: Mon, 18 May 2020 15:39:36 +0800
Message-ID: <CAMpQs4Kkwyp8+gyXvzCGmf0HizqqUbShXonin4sdAh7B=eZ4jw@mail.gmail.com>
To: ltp@lists.linux.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] The problem about core dump
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksIGFsbO+8mgpJIGFtIHRoZSBuZXdlciBhYm91dCBMVFAuCkkgZmluZCBzb21lIHRlc3QgY2Fz
ZXMsIHN1Y2ggYXMga2lsbDExIGFuZCBtbWFwMTYsIHRoYXQgd2lsbCBwcm9kdWNlCnRoZSBjb3Jl
IGR1bXAgaW4gdGhlIHN5c3RlbS4KQnV0IHRoZXNlIHRlc3QgY2FzZXMgYXJlIHN0aWxsIHBhc3Nl
ZCBhdCBsYXN0LgpJcyB0aGlzIG5vcm1hbD8KSG93IGNhbiBJIGV4cGxhaW4gaXQ/CkFsc28sIHlv
dSBjYW4gYW5zd2VyIHVuZGVyIHRoaXMgaXNzdWUKaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4LXRl
c3QtcHJvamVjdC9sdHAvaXNzdWVzLzY4MgoKLS0tClJlZ2FyZHMuCkFhcm9uLgoKLS0gCk1haWxp
bmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
