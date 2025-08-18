Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 994AFB298E2
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Aug 2025 07:27:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1755494855; h=mime-version :
 references : in-reply-to : date : message-id : to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=T2DxOJmp7b9XgeD9YcUPr4ziGksO2wVnAYoIj0fB5go=;
 b=arR7VawXCRW5PlfV/fKWP/gqCV2J8yvUOUt9feCuOaIEZ564TEaKHxnVSwkalrriyZYun
 uHcNpGMKz/svFeCIrgUryJY+Vsgt5iI6dqT47bfusB7QpqyiyqIqOSmiT6X6se6kYChZy35
 HfRWsg4cJnxdNhz4xsQQR8NKsZVsGwo=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CB51A3CC640
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Aug 2025 07:27:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A47113C4B63
 for <ltp@lists.linux.it>; Mon, 18 Aug 2025 07:27:33 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 9F7A56002CE
 for <ltp@lists.linux.it>; Mon, 18 Aug 2025 07:27:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755494850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eZx1lmDWXRTUMn3hnWkZhICIFnDKUW2ZrX8/bmWaJD8=;
 b=GNsCaIPhBU9Qv9KZK2zfWzzhj8sAgaxXYBpStgeh45P92KFp1eOupNg1QXmEJrkty7w4Xo
 ojfChZbI6tTAqua2ok9zTN0BAuNGnBLIdxrvZ/Ii2WCfhqdD7Em9gHJiCq9gO166jxsGG5
 w4TTKacIhkUb9wRgJqrMvo84C2hsDPw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-493-LhB0dzLvPyGHdYlu4P6Kxg-1; Mon, 18 Aug 2025 01:27:28 -0400
X-MC-Unique: LhB0dzLvPyGHdYlu4P6Kxg-1
X-Mimecast-MFC-AGG-ID: LhB0dzLvPyGHdYlu4P6Kxg_1755494847
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-45a1b04f817so11681655e9.1
 for <ltp@lists.linux.it>; Sun, 17 Aug 2025 22:27:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755494847; x=1756099647;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eZx1lmDWXRTUMn3hnWkZhICIFnDKUW2ZrX8/bmWaJD8=;
 b=Y/zQnDufd2VwPoFdhydEsQhh04268MvuQP8Xd34Cq9aauQRQiB9gf11MU0/UTphXKT
 Iemih79pwwfWCiXODCRIV5WMTr68EepOJtzoDisky64BwjVS5jXHqXM3FzGVMvX7ihf8
 N3vQ6PtUMY1yhbhVAN1y7SJb81oIRD/g25v1iO6YiOwRrOccmGcPNRlshrzi6OyZSwEe
 amQrmt8emRNWCubVxksQ3o+ralSDKB6ScxfnTwt4QUsQgntlmQOkwl2dimpa5xLJnGCt
 Gh/m4FJUSQ0RrTZvt9z3Cq+5c47taoh/Z0izB/yUpdqyj/JUZY+8EurD4V0i26YqX65E
 FLwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyzE/Vo87xif2/gpgyJEl1hPxhTLy7dvRMifL5I7KEPwz8aqqUVugxq9i0u87jHJxPL2Y=@lists.linux.it
X-Gm-Message-State: AOJu0YzQ1IixKh1cwZTpov+D2UZiBfr0zFKZr7hhh48PLGbgSWsQR37F
 vud1Q/K4+UmfPxm0HEgaJd3C/t2+RjO2la5jU5jVnzMtlrHC6+8wh67xRlITcMcsBb/+WbttKQC
 L7wU8X42Twwqj4Hpz5ZFhUOzLbh3Gau4e0ldxeZfrzhI9N1I6cPyE7iysUayZz4cxMk5Dnl1LMu
 Qb0m5i58bZxQboL6vZ0DUyu88ZqQs=
X-Gm-Gg: ASbGncvOzAeWNnD6iSjtJnVlFcSeTZidce5Gc5VUUzLh6FyXa3H420xN4lhXRE3jcpj
 J6irFmiWE+qWlV3qJu+0kiEfOR36z9l5+k25P7w/QsU3svhsllUhsSG8RjlPYbAiu1Mn0qTsWpi
 EthalgAXUgSs3LSJrIgvyU
X-Received: by 2002:a05:600c:4451:b0:456:1824:4808 with SMTP id
 5b1f17b1804b1-45a21867837mr81322675e9.32.1755494847333; 
 Sun, 17 Aug 2025 22:27:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5L/wEKBG4HMgs6yDM6EkxF/U/DnHYnprAVUm3GqvQYZlIqmKGU+Nd4l6g7fTHRYR4CVmBh6LQoGo5SYS28nI=
X-Received: by 2002:a05:600c:4451:b0:456:1824:4808 with SMTP id
 5b1f17b1804b1-45a21867837mr81322515e9.32.1755494846983; Sun, 17 Aug 2025
 22:27:26 -0700 (PDT)
MIME-Version: 1.0
References: <39ee7abdee12e22074b40d46775d69d37725b932.1754386027.git.jstancek@redhat.com>
 <5032022.31r3eYUQgx@thinkpad> <20250814042627.GA916683@pevik>
In-Reply-To: <20250814042627.GA916683@pevik>
Date: Mon, 18 Aug 2025 07:27:10 +0200
X-Gm-Features: Ac12FXzP0Ku5leyC4FqAdeGW_CylCtIR0tqKT1B1MremyWRUj6Vcb62YJg_qq0E
Message-ID: <CAASaF6x62H-qecmdoKJ-0GYkNPOYeCmjzwVn=E7rFNEFtmQ0Rg@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tAl5NlobM5JdXzokURtuU3_QAByT4NZaRw9Wm6y8rR8_1755494847
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] syscalls/epoll_ctl04: add ELOOP to expected errnos
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
From: Jan Stancek via ltp <ltp@lists.linux.it>
Reply-To: Jan Stancek <jstancek@redhat.com>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gVGh1LCBBdWcgMTQsIDIwMjUgYXQgNjoyNuKAr0FNIFBldHIgVm9yZWwgPHB2b3JlbEBzdXNl
LmN6PiB3cm90ZToKPgo+IEhpIEphbiwgYWxsLAo+Cj4gPiBIaSwKPiA+IEFsc28gYmVsb3cgdHlw
byBmaXggaW4gY29tbWl0IG1lc3NhZ2UuCj4KPiA+IFRoYW5rcyEKPgo+Cj4gPiBPbiBUdWVzZGF5
LCBBdWd1c3QgNSwgMjAyNSAxMToyNzoyMyBBTSBDRVNUIEphbiBTdGFuY2VrIHZpYSBsdHAgd3Jv
dGU6Cj4gPiA+IEtlcm5lbCBjb21taXQgZjJlNDY3YTQ4Mjg3ICgiZXZlbnRwb2xsOiBGaXggc2Vt
aS11bmJvdW5kZWQgcmVjdXJzaW9uIikKPiA+ID4gYWRkZWQgYW4gZXh0cmEgY2hlY2tzIGZvciBk
ZXRlcm1pbmluZyB0aGUgbWF4aW11bSBkZXB0aCBvZiBhbiB1cHdhcmRzIHdhbGssCj4gPiA+IHdo
aWNoIHN0YXJ0aWduIHdpdGggNi4xNy1yYyBrZXJuZWxzIG5vdyBoaXRzIEVMT09QIGJlZm9yZSBF
SU5WQUwuCj4gPiBzL3N0YXJ0aWduL3N0YXJ0aW5nCj4KPiBJIGRhcmVkIHRvIG1lcmdlIHlvdXIg
cGF0Y2gsIHdpdGggYWJvdmUgZGVzY3JpcHRpb24gZml4ZWQuCgpUaGFua3MgKEkgd2VudCBvbiBo
b2xpZGF5cyBiZWZvcmUgSSBjb3VsZCBtZXJnZSB0aGlzKS4KCj4KPiBLaW5kIHJlZ2FyZHMsCj4g
UGV0cgo+CgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xp
c3RpbmZvL2x0cAo=
