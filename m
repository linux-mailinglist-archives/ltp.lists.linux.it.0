Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CFF972746
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Sep 2024 04:39:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E3D193C18FA
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Sep 2024 04:39:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A82533C02D1
 for <ltp@lists.linux.it>; Tue, 10 Sep 2024 04:39:27 +0200 (CEST)
Authentication-Results: in-5.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=liwan@redhat.com;
 receiver=lists.linux.it)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 37C6B6006D7
 for <ltp@lists.linux.it>; Tue, 10 Sep 2024 04:39:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725935962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1a9xZI6Fs1T24vRQMFfQ/KCA62LhHA9qkhpC2RKyrUw=;
 b=dPMIwwpjAnBfpltQ8ObTqA6zaunLg1MHJSZvmTuUOwfSu2RtZkATYoMHOu7pPfXSBywsh1
 sjiAYbWm4xyWoo9hOYNDRCyznig8OPDpScj+wa+zfOqQUItV95wtpZusBQPQMjY9oh+fZC
 yzg+XGhnCaUY66trWDEMKXampSTkriA=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-370-r3GYwhWrM--5ey3GH2rmDg-1; Mon, 09 Sep 2024 22:39:19 -0400
X-MC-Unique: r3GYwhWrM--5ey3GH2rmDg-1
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-7179469744dso451742b3a.2
 for <ltp@lists.linux.it>; Mon, 09 Sep 2024 19:39:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725935957; x=1726540757;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1a9xZI6Fs1T24vRQMFfQ/KCA62LhHA9qkhpC2RKyrUw=;
 b=D+atR0EQIqNp1TzIHRf2MsLcO3EOwvqu6nNuW0SixJyk5Kaxlcatu4YglwmhHt9Ofv
 l5MZ53Tnfa12wTP22P1v/RhY0WxnN2crwgtKupXOpbeTF5tQAZQ4R8QjEZQnrOeozDmY
 ksIk5Q1YEsf72Gw6KnTrW/v9e0F+Lm9wCnadp0+VOFrbt2Y8R2flXERwzYQPjr7gfUfe
 6s9X+wRJkpSTv6+LbZ6iX1j/v3DltdFqByhDQuiB5uhUHd2FE+7bAiV9xsEgmvK0Fqmf
 DhEyCGeKb+5sAA/LLp7d35L6C0sJ4P1vSjZWW5EMnWSi+VcCP1Wuf2blSDd79wvI9bHN
 vmyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6ySy2YL1AxOKfHzntSL+vupB2Oe7m5Gj+535X0nGhsqYwBGxDrNfXVzWHLNr1Obbc0X0=@lists.linux.it
X-Gm-Message-State: AOJu0YzvWVh6ShcqgvGdFY/zu1AgMJlLd2+NuBbQdXgtJz7El5isj7eY
 ++De8z94xUBSVzW3t51wvLQkYqksOZYNOwqHLYFSpvhUub1ws46io5JK6s7z9LRNWytGZlT2+C/
 0i6z5ZxtkeXZwBM2383gYyMekJkbYFXBYpcDbRM/97qKOLDAftsUcMOFc3MoxDBSqQNjgFOB4Vq
 i/4fKwblDPWEtZE81L60f59Yc=
X-Received: by 2002:a05:6a00:2e86:b0:70a:f576:beeb with SMTP id
 d2e1a72fcca58-718e33a0ea2mr10053675b3a.15.1725935957376; 
 Mon, 09 Sep 2024 19:39:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZam1R+USPnR6koCjWPSAmyE/rdcUP+fCuXfXrPzSiW1O9YhO6ndfugBVme4m4DFMRBnjHYwgSB5savFLfW5g=
X-Received: by 2002:a05:6a00:2e86:b0:70a:f576:beeb with SMTP id
 d2e1a72fcca58-718e33a0ea2mr10053647b3a.15.1725935956841; Mon, 09 Sep 2024
 19:39:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240905134502.33759-1-mdoucha@suse.cz>
 <20240905134502.33759-2-mdoucha@suse.cz>
 <20240906080200.GA985598@pevik>
 <gmjff4tugu3ccio35isd4jfdbvxmriepvd3z2vxruzw46zcpha@7mk7g3awjgw5>
In-Reply-To: <gmjff4tugu3ccio35isd4jfdbvxmriepvd3z2vxruzw46zcpha@7mk7g3awjgw5>
From: Li Wang <liwang@redhat.com>
Date: Tue, 10 Sep 2024 10:39:04 +0800
Message-ID: <CAEemH2dk12F+YJLbDB+G2YuiHpxrzAgPxOmyODqrResZr0+5mA@mail.gmail.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [LTP] [PATCH 2/2] fallocate05: Deallocate whole file on bcachefs
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
Cc: ltp@lists.linux.it, linux-bcachefs@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gRnJpLCBTZXAgNiwgMjAyNCBhdCA2OjE44oCvUE0gS2VudCBPdmVyc3RyZWV0IDxrZW50Lm92
ZXJzdHJlZXRAbGludXguZGV2Pgp3cm90ZToKCj4gT24gRnJpLCBTZXAgMDYsIDIwMjQgYXQgMTA6
MDI6MDBBTSBHTVQsIFBldHIgVm9yZWwgd3JvdGU6Cj4gPiBIaSBNYXJ0aW4sIGFsbCwKPiA+Cj4g
PiBbIENjIEtlbnQgYW5kIEJjYWNoZWZzIE1MIF0KPiA+Cj4gPiA+IFRoZSBkZWZhdWx0IGRlYWxs
b2NhdGlvbiBzaXplIGlzIGxpa2VseSB0b28gc21hbGwgZm9yIGJjYWNoZWZzCj4gPiA+IHRvIGFj
dHVhbGx5IHJlbGVhc2UgdGhlIGJsb2Nrcy4gU2luY2UgaXQgaXMgYWxzbyBhIGNvcHktb24td3Jp
dGUKPiA+ID4gZmlsZXN5c3RlbSwgZGVhbGxvY2F0ZWQgdGhlIHdob2xlIGZpbGUgbGlrZSBvbiBC
dHJmcy4KPiA+Cj4gPiBNYWtlIHNlbnNlLgo+ID4gUmV2aWV3ZWQtYnk6IFBldHIgVm9yZWwgPHB2
b3JlbEBzdXNlLmN6Pgo+Cj4gSSBoYXZlbid0IGxvb2tlZCBhdCB0aGlzIHNwZWNpZmljIHRlc3Qs
IGJ1dCBvbmUgdGhpbmcgdGhhdCB3ZSBydW4gaW50bwo+IHdpdGggdGhlIHdlaXJkIENvVyBiZWhh
dmlvdXIgdGVzdHMgaW4geGZzdGVzdHMgaXMgdGhhdCBiY2FjaGVmcyBidHJlZQo+IG5vZGVzIGFy
ZSAyNTZrIGJ5IGRlZmF1bHQgLSB5b3UncmUgZ29pbmcgdG8gc2VlIHdlaXJkIGVmZmVjdHMgZnJv
bSB0aGF0Cj4gaWYgdGVzdHMgYXJlIGxvb2tpbmcgYXQgZGlzayB1c2FnZS4KPgoKVGhhbmsgeW91
LiBQYXRjaCBtZXJnZWQuCgoKLS0gClJlZ2FyZHMsCkxpIFdhbmcKCi0tIApNYWlsaW5nIGxpc3Qg
aW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
