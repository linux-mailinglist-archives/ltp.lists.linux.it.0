Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9164694756F
	for <lists+linux-ltp@lfdr.de>; Mon,  5 Aug 2024 08:41:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5211E3D1ED7
	for <lists+linux-ltp@lfdr.de>; Mon,  5 Aug 2024 08:41:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2D7B13D1BC0
 for <ltp@lists.linux.it>; Mon,  5 Aug 2024 08:41:17 +0200 (CEST)
Authentication-Results: in-5.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=liwan@redhat.com;
 receiver=lists.linux.it)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 719DA6008C2
 for <ltp@lists.linux.it>; Mon,  5 Aug 2024 08:41:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722840074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EafjWlwRUWidI+IaQmAnoyg4nPMull+exCKFLrcwCqY=;
 b=fSU1bgzXTVC6uBG+wh++V/7ZDkHKi5SpUuH/Pj4tGdj3rxgVXY/wT5zkoLxQoqWi9Mmowo
 ba4cwrSbBhjVhoAB9HIr0oPFLliv5MgQxgTy/Qewg6aFb6B4CWMnOsQX1Rb++Wp6MVh7wd
 /RU3vPiA1hdsn42rb4lP65Fj4/S80iA=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-458-33IaeXckOZeVm23hup-Qvw-1; Mon, 05 Aug 2024 02:41:12 -0400
X-MC-Unique: 33IaeXckOZeVm23hup-Qvw-1
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-70ac9630e3aso8176724a12.1
 for <ltp@lists.linux.it>; Sun, 04 Aug 2024 23:41:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722840071; x=1723444871;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EafjWlwRUWidI+IaQmAnoyg4nPMull+exCKFLrcwCqY=;
 b=jyTeJQEOcSXkaguPYjnFMtPt8NTSWWlc2iZQx/mrSiXfl+8YeqSVhjj+m/v/UK8xsQ
 LLVpvtW9LPLIlbgr6qcKAMNTAWe1vkm55LJI47AY2If1kPotCu9iwOns8jTBPLExtWYX
 /zoqf50TN9Hc3gR4GgnDW9BrOM2xKgmHHwGA7mmDOMtgvtTbO6LK/R2ob6f4z6+D3yCw
 +D7bN9HFntF5OpWaYC9ppYOHuTbUgr9oKhC5HQPxe15OiXLVJ2yqGOctIzLtoQ/bFhPq
 VsyZDNkdEpptvDZJ8NFYQTHv6L5rjLDZyIeGhEVYdo1Tdm+ZFcma7kSfI9mPQkpHTrLW
 Cwtw==
X-Gm-Message-State: AOJu0Yx5fX26ayUxK7EouX3qYugMvTh0H8FJHdYM0MYb0KDIKq+B+hF3
 2QeDbR3RHLnH1XaSa7Enmm0dpvqswBRXKvLFejGAeVNWN2hRbtfXU9uazBjAx+PC7s6P4r8Aplc
 8z9I+zSWVsdveql9pmPXvp98znp7i+I6kUGUWmBDZZED8zg42mLHdfCvx/swypDeJTRiJ3QuKYm
 Zb1BT3vn2tnFJ9FYNjV6Ts+a4=
X-Received: by 2002:a05:6a20:918c:b0:1c4:8dc0:8357 with SMTP id
 adf61e73a8af0-1c69958467dmr70372637.25.1722840070858; 
 Sun, 04 Aug 2024 23:41:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwqWKGFL+gNH0GswrLrsORoHPKRMLvEL+O+QVWd2bg2zfUSP1uRMG7Uyq/otGMHnn6o2POKzUh4DSXPbxY+mU=
X-Received: by 2002:a05:6a20:918c:b0:1c4:8dc0:8357 with SMTP id
 adf61e73a8af0-1c69958467dmr70358637.25.1722840070419; Sun, 04 Aug 2024
 23:41:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAEemH2c5uqD=x0OiPcH5aKJHCJ8vtQ0GdMoWZnZxXT4rLfCcYg@mail.gmail.com>
 <20240803122258.5479-1-liwang@redhat.com>
 <8f1a4f23-eb42-43f8-9e57-dc4417b0c4b4@suse.com>
In-Reply-To: <8f1a4f23-eb42-43f8-9e57-dc4417b0c4b4@suse.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 5 Aug 2024 14:40:58 +0800
Message-ID: <CAEemH2etiV6=YxpgNpc+XQq-F2s9zdL+ooniX4H4JJ=Bvnjc+Q@mail.gmail.com>
To: Andrea Cervesato <andrea.cervesato@suse.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [LTP] [PATCH] mseal01: handle more possible errnos when
 pkey_alloc gets fail
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gTW9uLCBBdWcgNSwgMjAyNCBhdCAyOjM44oCvUE0gQW5kcmVhIENlcnZlc2F0byB2aWEgbHRw
IDxsdHBAbGlzdHMubGludXguaXQ+Cndyb3RlOgoKPiBIaSEKPgo+IFRoYW5rcyBmb3IgaGVscGlu
ZyBvbiBtc2VhbDAxLiBJIGFscmVhZHkgc3VibWl0dGVkIHRoZSBwYXRjaCwgYnV0IHdlIGNhbgo+
IGFwcGx5IGEgbmV3IHBhdGNoIG9uIHRvcCBvZiBpdCB3aXRob3V0IHByb2JsZW1zLgo+IFJldmll
dyBiZWxvdwo+Cj4gT24gOC8zLzI0IDE0OjIyLCBMaSBXYW5nIHdyb3RlOgo+ID4gU2lnbmVkLW9m
Zi1ieTogTGkgV2FuZyA8bGl3YW5nQHJlZGhhdC5jb20+Cj4gPiAtLS0KPiA+ICAgdGVzdGNhc2Vz
L2tlcm5lbC9zeXNjYWxscy9tc2VhbC9tc2VhbDAxLmMgfCAxNiArKysrKy0tLS0tLS0tLS0tCj4g
PiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQo+ID4K
PiA+IGRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL21zZWFsL21zZWFsMDEu
Ywo+IGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9tc2VhbC9tc2VhbDAxLmMKPiA+IGluZGV4
IGViMmY0ZDU4OC4uMmZmNmVkMTE5IDEwMDY0NAo+ID4gLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9z
eXNjYWxscy9tc2VhbC9tc2VhbDAxLmMKPiA+ICsrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2Fs
bHMvbXNlYWwvbXNlYWwwMS5jCj4gPiBAQCAtMjUsNiArMjUsNyBAQAo+ID4KPiA+ICAgI2luY2x1
ZGUgInRzdF90ZXN0LmgiCj4gPiAgICNpbmNsdWRlICJsYXBpL3N5c2NhbGxzLmgiCj4gPiArI2lu
Y2x1ZGUgIi4uL3BrZXlzL3BrZXkuaCIKPiBUaGUgcHJvYmxlbSB3aXRoIHRoaXMgYXBwcm9hY2gg
aXMgdGhhdCB0ZXN0aW5nIHN1aXRlcyB3b24ndCBiZQo+IGluZGVwZW5kZW50IGFueW1vcmUuCj4g
V2UgbmVlZCB0byBtb3ZlIGFsbCBwa2V5cy9wa2V5LmggZGVjbGFyYXRpb25zIGluc2lkZSB0aGUg
bGFwaS8gZm9sZGVyLAo+IGluIG9yZGVyIHRvIHVzZSBwa2V5IHN5c2NhbGxzIGZyb20gYW55IHRl
c3Rpbmcgc3VpdGUuCj4KClN1cmUsIEkgd2lsbCB1cGRhdGUgbXkgcGF0Y2ggdG8gaW5jbHVkZSB0
aGF0LiBUaGFua3MhCgoKLS0gClJlZ2FyZHMsCkxpIFdhbmcKCi0tIApNYWlsaW5nIGxpc3QgaW5m
bzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
