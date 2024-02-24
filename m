Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F098623F1
	for <lists+linux-ltp@lfdr.de>; Sat, 24 Feb 2024 10:32:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1708767176; h=mime-version :
 date : message-id : references : in-reply-to : to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=F1EhAZF1QenoRZXEocBd4W2QNhzwtJBGlgCZbsHKXEQ=;
 b=Vw0kRExEzssuIs5qt/uvSR62BQrup7P0MrHQbsqdqmLWCaAugwIHzylyfdRbKJH22PJXh
 WqXXlgMXsRbTdErZ0qK6DFEwJjv01wHVMj+vJd+gKLqQppvOmEUoAtPhylIRFGA+FQ3z+AL
 kT2jzXmCs2rn5ybuYiymYjkpWCLlrw0=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 92AA83CF0C8
	for <lists+linux-ltp@lfdr.de>; Sat, 24 Feb 2024 10:32:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D09F03CE815
 for <ltp@lists.linux.it>; Sat, 24 Feb 2024 10:32:45 +0100 (CET)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 313DC10028DC
 for <ltp@lists.linux.it>; Sat, 24 Feb 2024 10:32:45 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4129ed3d15aso898055e9.0
 for <ltp@lists.linux.it>; Sat, 24 Feb 2024 01:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1708767164; x=1709371964; darn=lists.linux.it;
 h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
 :from:content-transfer-encoding:from:to:cc:subject:date:message-id
 :reply-to; bh=JsUgdNEq9P5o7TeSkoLc0xLvLpR6wIZewnTevwQPjgs=;
 b=C8NS8bEQGZwyXuyAbQPj+Kxl/qb77ntwvXgk+8TC/IU3m2f3cIlRnHbsIXsxhzqFSp
 0fNk0vcc58KUD0Yuh4hKFnPyXbeo4MUpefXJ42tJnrJEQvTSZhBBFQ7ZfkH8/Oyfsymi
 OSW4P/dhxO0Uo1C59TxCk3BXYovOvEvrvtt1DK6ILSSH0hsBuqsrAWHx8BLEwGOeCJu8
 n5IZYf79weOApb8K3Xye+HjUFaSUA5HldmkoXNFW3X87uwuOzzbWv/3nUbNZNVf9yHHF
 GOtdysyUWireeidMn7GJRgyOlZPdYqnVyIsvI5FROxZBHyKihSyp+vq3UFq6H2sdV+k1
 JstA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708767164; x=1709371964;
 h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
 :from:content-transfer-encoding:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JsUgdNEq9P5o7TeSkoLc0xLvLpR6wIZewnTevwQPjgs=;
 b=achhrr8U4MrmWyRoOjMx5CO65MNJi9J0qfS02KDiajJ4nIQI3YC0k7YsPtqdPOZPlX
 EaAeXPzmTmQ76tgy6VttHaPK4eZFUIe+SSJBY6A+2EcGuQJ9nr+SIKlbcnJzh00p2QHa
 /ExMLlk2Hlt+Ih8HRm/S/AU/uuO/ZWU0uShwXWklf+Ax5lgaI52ADNH60BD2ONWVS7w4
 K89o0oRw43H02aY0q0y2xz7o0Awy97w+bljqaJ2eQGLVirc4vVM6Ld27ETO6bGF0kIKz
 DgC3+MSEFuLvaI7HA35lleQuhHY3VdACgJidd3nH7qPmciRNtPJDOqOq0TED+JaE1bR/
 mHKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWy/nuyH6S+eQrO4tRqozLKvJCx4arBqRnVpLu2YItKIzTL0LjTf2UE4ctXBxKF3h96cdw4XxGrB9lnxLk2ajVvoTQ=
X-Gm-Message-State: AOJu0YxpEpZmLC29ZKwpXrLITEwp3KYnb2C7T77ECk/JsBbw9J1rKGso
 jw2NMwVJngjNC8dHDBR7H93g8EakYIMOlpCWnGEsbAigH95km/62fVyqMKcQkUY=
X-Google-Smtp-Source: AGHT+IGHpVJQVCUY5P8Peh0TLDzp9ixdlo82t6tC8RqWtgOKDnQDF3zg8nlSKCBxzzcArfOJWVNmkQ==
X-Received: by 2002:a05:600c:4f52:b0:412:8872:e8f4 with SMTP id
 m18-20020a05600c4f5200b004128872e8f4mr1540209wmq.1.1708767164731; 
 Sat, 24 Feb 2024 01:32:44 -0800 (PST)
Received: from smtpclient.apple ([212.86.60.148])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a05600c19c900b004129f2dc450sm494110wmq.31.2024.02.24.01.32.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Feb 2024 01:32:44 -0800 (PST)
Mime-Version: 1.0 (1.0)
Date: Sat, 24 Feb 2024 10:32:09 +0100
Message-Id: <49150628-46DE-4F53-9D4C-E6631D8E61CC@suse.com>
References: <20240223154732.GD1486515@pevik>
In-Reply-To: <20240223154732.GD1486515@pevik>
To: Petr Vorel <pvorel@suse.cz>
X-Mailer: iPhone Mail (21D61)
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v4] Add stat04 test
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
From: Andrea Cervesato via ltp <ltp@lists.linux.it>
Reply-To: Andrea Cervesato <andrea.cervesato@suse.com>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCgo+IE9uIDIzIEZlYiAyMDI0LCBhdCAxNjo0NywgUGV0ciBWb3JlbCA8cHZvcmVsQHN1c2Uu
Y3o+IHdyb3RlOgo+IAo+IO+7v0hpIEFuZHJlYSwKPiAKPj4+PiArICAgIGNoYXIgKnN5bW5hbWUg
PSAibXlfc3ltbGluazAiOwo+Pj4+ICsgICAgY2hhciAqdG1wZGlyID0gdHN0X2dldF90bXBkaXIo
KTsKPj4+PiArCj4+Pj4gKyAgICBTQUZFX1NZTUxJTksodG1wZGlyLCBzeW1uYW1lKTsKPj4+PiAr
Cj4+Pj4gKyAgICBzdHJ1Y3Qgc3RhdCBwYXRoOwo+Pj4+ICsgICAgc3RydWN0IHN0YXQgbGluazsK
Pj4+IG5pdDogbWF5YmUgZGVmaW5lIHN0cnVjdCBhdCB0aGUgdG9wIG9mIHRoZSBmdW5jdGlvbj8K
Pj4gVGhpcyBpcyBjb21tb24gaW4gdGhlIGZpcnN0IHZlcnNpb25zIG9mIEMsIGJ1dCBhIGdvb2Qg
cHJhY3RpY2UgaXMgdG8gZGVmaW5lCj4+IHZhcmlhYmxlcyBhcyBjbG9zZSBhcyBwb3NzaWJsZSB3
aGVyZSB0aGV5IGFyZSB1c2VkIGluIG9yZGVyIHRvIGltcHJvdmUKPj4gcmVhZGFiaWxpdHkuCj4g
Cj4gRmFpciBlbm91Z2guCj4gCj4+Pj4gKwo+Pj4+ICsgICAgVFNUX0VYUF9QQVNTKHN0YXQodG1w
ZGlyLCAmcGF0aCkpOwo+Pj4+ICsgICAgZnJlZSh0bXBkaXIpOwo+Pj4gSWYgU0FGRV9TWU1MSU5L
KCkgZmFpbHMsIGZyZWUoKSB3aWxsIG5vdCBoYXBwZW4uIEkgd29uZGVyIGlmIHdlIHNob3VsZCBi
b3RoZXIKPj4+ICh3ZSdkIGhhdmUgdG8gc2V0IGl0IE5VTEwgYW5kIGFkZCBhIGNsZWFudXAgZnVu
Y3Rpb24pLgo+IAo+Pj4gUmV2aWV3ZWQtYnk6IFBldHIgVm9yZWwgPHB2b3JlbEBzdXNlLmN6Pgo+
IAo+Pj4gS2luZCByZWdhcmRzLAo+Pj4gUGV0cgo+IAo+IC4uLgo+IAo+PiBBY2NvcmRpbmcgdG8g
Q3lyaWwgc3VnZ2VzdGlvbnMgd2UgYXJlIHByb2JhYmx5IGRvbmUgd2l0aCB0aGlzIHBhdGNoIHNv
IGl0Cj4+IGNhbiBiZSBtZXJnZWQuIElzbid0IGl0Pwo+IAo+IFdlbGwgeW91IGZyZWUoKSBsYXRl
ciBpbiB0aGUgZnVuY3Rpb24uIEJ1dCBDeXJpbCdzICBub3RlIHNvdW5kcyByZWFzb25hYmxlIGZv
cgo+IG1lOgo+ICAgICJjYWxsIGl0IG9uY2UgaW4gdGhlIHRlc3Qgc2V0dXAoKSBvciB1c2UgIi4i
IGluc3RlYWQuIgo+IAo+IENvdWxkIHlvdSBwbGVhc2UgZG8gaXQ/Cj4gCk1ha2VzIHNlbnNlLiBJ
IHRoaW5rIHdlIHNob3VsZCBhZGFwdCBhbGwgb3RoZXIgdGVzdHMgYXMgd2VsbCBiZWNhdXNlIGl0
4oCZcyBmdWxsIG9mIG1lbW9yeSBsZWFrYWdlIHdoZW4gaXQgY29tZXMgdG8gZ2V0IHRlbXBvcmFy
eSBkaXJlY3RvcnkuCgo+IEFsc28gbW9zdCBvZiB0aGUgdGVzdHMgcmVhbGx5IHJ1biB0c3RfZ2V0
X3RtcGRpcigpIGluIHRoZSBzZXR1cCgpIChvciBjbGVhbnVwKCksCj4gdGhlcmUgYXJlIGV4Y2Vw
dGlvbnMgKG5ldyBBUEk6IHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvcGF0aGNvbmYvcGF0aGNv
bmYwMS5jLAo+IG9sZCBBUEk6IHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3ltbGluay9zeW1s
aW5rMDEuYywKPiB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2Nsb25lL2Nsb25lMDIuYyksIHdo
aWNoIHNob3VsZCBiZSBmaXhlZC4KPiBJTUhPIHRlc3RzIHdoaWNoIGNhbGwgdHN0X2dldF90bXBk
aXIoKSBpbiB0aGUgcnVuKCkKPiAKPiBLaW5kIHJlZ2FyZHMsCj4gUGV0cgo+IAo+PiBUaGFua3Ms
Cj4+IEFuZHJlYQo+IAoKUmVnYXJkcywKQW5kcmVhCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0
dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
