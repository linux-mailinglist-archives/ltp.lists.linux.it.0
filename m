Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6999EB1FD8A
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Aug 2025 03:44:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1754876671; h=mime-version :
 references : in-reply-to : date : message-id : to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=/kic89O2A6P7ehITA69JVYD+DsOnZfIlHXX0NB9yvDE=;
 b=X+gNQGLv3tlwurMFggnR4GS01hfojlo1tFEaP9e9IQUDUXRelR0W7Oc0atd62oxLIex80
 4fK/muRi3E5IatYcZ32ZnIAxDxWW/0WUqbmWO1Z97f3Nw/wG51fvyGYPGL66wo0/d/mJKqK
 RIgz4lXpmvABKKWPLf809PyJ8EaXG88=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ED1073C2CC2
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Aug 2025 03:44:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CAF713C25AA
 for <ltp@lists.linux.it>; Mon, 11 Aug 2025 03:44:27 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 883B31400199
 for <ltp@lists.linux.it>; Mon, 11 Aug 2025 03:44:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754876662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MqWWYX25QM2GsxQ2jPKq/p17xHOR9L27DPybYFBefzI=;
 b=EqlwxuQB64tuYXlw7Vv198Sgsyv6SvNDlb7otCf2RsIMkc11LgFzlYlDU/Js2SqnZKrZEH
 WaKEE0mde2L3khpSBtIHU5TRLZevCNKxmZQpxN9WPlqvtAmZ1puHNcwLQ0ZGJAJjjVWzVR
 r/+1Ev2Ow8u0mgEcGRjENHokoIWsZN0=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-169-7UoyFjhUOAeC81RFMvEvGg-1; Sun, 10 Aug 2025 21:44:20 -0400
X-MC-Unique: 7UoyFjhUOAeC81RFMvEvGg-1
X-Mimecast-MFC-AGG-ID: 7UoyFjhUOAeC81RFMvEvGg_1754876659
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-24249098fd0so43795035ad.0
 for <ltp@lists.linux.it>; Sun, 10 Aug 2025 18:44:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754876659; x=1755481459;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MqWWYX25QM2GsxQ2jPKq/p17xHOR9L27DPybYFBefzI=;
 b=wUVR4mnUym8D39mR1yilY9IIgjUTR1D7PjuWun1etaDkSNNGVCz3MmJ9ndMijyKkh5
 QWuuyIYw9nO6YvzlJJYQg0xKn0k7ZHRPSljE3Imxb2w2bjajKNl6gvRo3L7LxKRdh2s0
 r+AWZkg5WNO+TXGWWe/F6q4TYZdS8ahs079wna4P176VsI7BOJJkASlkBjhO2J8YnhNM
 Q67GvM7Ib7teFy4x8mBFLxMsxg4bGL6TTkbX5uw6twFWZBstGinoccizz1SPQi1/nHAZ
 CchbZkxcL1oWcTNQt8HKrIAAlj7W7nVgfQAXH0JgajM+fzPC3jSx2fXszxaogJ23uamA
 g6DA==
X-Gm-Message-State: AOJu0YzmTMT+RJBdbtTjzokGe/jqEFoW/8Ntl7FlqAt1WmjdssW+2sCW
 VW4IujwuE4pCLE0mHSHPFlYEf8YfBYssL5Ak7FCXG0FifgZrcb0j+ZplqvXwn6nDvqSfhz769Fv
 Ok8Jc7ypkVmZgbzk3gPwlryeKvb7XnW7Ew7YLsJaTeBm4+VfvAfLdUTI/c8xq5Q//FWK9gg0Dhx
 I2vEdR0HJdMQXG43YVgC8dikQJkOI=
X-Gm-Gg: ASbGncu3jqaI7gMipfdAVndYtyFT5wQw1JdI1AuMKT6SA5wWU4ctUGfUh0auMbN/Yao
 0FxwG2M8KTiAyHNiz4fGQ2L3CGFEZjRSNgHRpl7NO+T1HTaiucub1Sa8wk0xa46v2V6P7/FfiJa
 KZRo+SHyxf+U6O6wo2pQEX8w==
X-Received: by 2002:a17:902:f64b:b0:240:3b9e:dd4c with SMTP id
 d9443c01a7336-242c2205ccdmr155702295ad.36.1754876659476; 
 Sun, 10 Aug 2025 18:44:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoudsmbCSy3NuDOMCFLHLCBfJhZwBpi3rl3N0V4eRlfZQuScCd+IWqyuPXUY/w71SIoJDQK0r56vebNVwpioE=
X-Received: by 2002:a17:902:f64b:b0:240:3b9e:dd4c with SMTP id
 d9443c01a7336-242c2205ccdmr155702085ad.36.1754876659042; Sun, 10 Aug 2025
 18:44:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250808110102.454689-1-pvorel@suse.cz>
In-Reply-To: <20250808110102.454689-1-pvorel@suse.cz>
Date: Mon, 11 Aug 2025 09:44:07 +0800
X-Gm-Features: Ac12FXxuyHDZAFrPH7n2WcV3bN7dRpLqFFgjHoew1myLjgGSw3OlkMICX-dwoGg
Message-ID: <CAEemH2c+w8T-2+ny290ahfMt6PAAXZyTrE9oqK1oNakhyYerYw@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oWkuOwpd7byebwhc8RYvHKXBpeHZuVhcAOlt2I64SvU_1754876659
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [LTP] [PATCH v2 0/3] autotools: Remove old checks
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
From: Li Wang via ltp <ltp@lists.linux.it>
Reply-To: Li Wang <liwang@redhat.com>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Rm9yIHNlcmllczoKUmV2aWV3ZWQtYnk6IExpIFdhbmcgPGxpd2FuZ0ByZWRoYXQuY29tPgoKT24g
RnJpLCBBdWcgOCwgMjAyNSBhdCA3OjAx4oCvUE0gUGV0ciBWb3JlbCA8cHZvcmVsQHN1c2UuY3o+
IHdyb3RlOgoKPiBDaGFuZ2VzIHYxLT52MjoKPiAqIEZpeCBjb21waWxhdGlvbiBlcnJvciBtaXNz
aW5nIGVuZGlmCj4KPiBMaW5rIHRvIHYxOgo+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcv
cHJvamVjdC9sdHAvbGlzdC8/c2VyaWVzPTQ2ODQwNCZzdGF0ZT0qCj4KPiBQZXRyIFZvcmVsICgz
KToKPiAgIFJlbW92ZSBtNC9sdHAtc2lnbmFsZmQubTQKPiAgIG00OiBsYXBpOiBEcm9wIGNoZWNr
IGZvciBvbGQgbGliY2FwLWRldmVsCj4gICBtNDogZmNudGwzMTogUmVtb3ZlIGNoZWNrIGZvciBz
dHJ1Y3QgZl9vd25lcl9leAo+Cj4gIGNvbmZpZ3VyZS5hYyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDIgLS0KPiAgaW5jbHVkZS9sYXBpL2NhcGFiaWxpdHkuaCAgICAgICAgICAgICAg
ICAgfCAgOCAtLS0tLS0tLQo+ICBtNC9sdHAtY2FwLm00ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8IDE3ICstLS0tLS0tLS0tLS0tLS0tCj4gIG00L2x0cC1mY250bC5tNCAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgMjEgLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIG00L2x0cC1zaWdu
YWxmZC5tNCAgICAgICAgICAgICAgICAgICAgICAgIHwgMTcgLS0tLS0tLS0tLS0tLS0tLS0KPiAg
dGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mY250bC9mY250bDMxLmMgfCAgOCAtLS0tLS0tLQo+
ICA2IGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA3MiBkZWxldGlvbnMoLSkKPiAgZGVs
ZXRlIG1vZGUgMTAwNjQ0IG00L2x0cC1mY250bC5tNAo+ICBkZWxldGUgbW9kZSAxMDA2NDQgbTQv
bHRwLXNpZ25hbGZkLm00Cj4KPiAtLQo+IDIuNTAuMQo+Cj4KPiAtLQo+IE1haWxpbmcgbGlzdCBp
bmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo+Cj4KCi0tIApSZWdhcmRz
LApMaSBXYW5nCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQv
bGlzdGluZm8vbHRwCg==
