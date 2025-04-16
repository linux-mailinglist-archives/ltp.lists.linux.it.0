Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C55E6A8B197
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Apr 2025 09:05:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1744787105; h=mime-version :
 references : in-reply-to : date : message-id : to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=Po/EAGKxZNaqpHktZRCf77ja8JxGo1ebUNQCcDiunWQ=;
 b=mADaHiR6NYrWATX7Mr6qHOSp9BqXgnbm6a6VpcyhNNqRWZkoI30saALHdBTlVC8tj+MJ/
 9BhKBxkYgp8b4oFWT01QMnYOrcHYhHVE6NZ0WDh9H+/m1OG8UJ/SWN5hDTtr0kMB0oTJYk8
 gJS5LqDiw2SMghp/nZcJuBlMcE73cmg=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 705E93CB944
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Apr 2025 09:05:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E76C73C1C0B
 for <ltp@lists.linux.it>; Wed, 16 Apr 2025 09:05:01 +0200 (CEST)
Authentication-Results: in-5.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=liwan@redhat.com;
 receiver=lists.linux.it)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C4E14600803
 for <ltp@lists.linux.it>; Wed, 16 Apr 2025 09:05:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744787099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O9RMsRNWv1oDYvWJeBNNJmlGLpsTmMu/Q+3wqBILq8g=;
 b=BlpJwtjjDQd7VjncreH2t214/0W3SpMyIageIIv2ut6kFtsaoFi0AnP2rohLkR/OGP9M4j
 XzJPMmBCzUq/14aKnm5Aw8MY4FyDIXUgEAaWGH7JW8uIGDEZFtdgAvoMVUfA5fs3L8nNon
 anlS842m6+P7HIDHZuGdwNcymlZ1dzo=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-513-aZ3xLCthNc-I50kO-PjBeA-1; Wed, 16 Apr 2025 03:04:57 -0400
X-MC-Unique: aZ3xLCthNc-I50kO-PjBeA-1
X-Mimecast-MFC-AGG-ID: aZ3xLCthNc-I50kO-PjBeA_1744787096
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-223fd6e9408so3426955ad.1
 for <ltp@lists.linux.it>; Wed, 16 Apr 2025 00:04:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744787095; x=1745391895;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O9RMsRNWv1oDYvWJeBNNJmlGLpsTmMu/Q+3wqBILq8g=;
 b=LjCdGGhZex6Z9SqCgd0lYlI1Zf+oygxT8tSw70H4MAuT6zNe9l87hYrLqy1iQ2WRos
 C5xXpJL9ElzCzBf+uSvlZA8XKs0tGZsfsAs9zUv9fDOfBLcxoabqNDpna2aiJNV3M/f2
 cz6C/wyWuc58ztmiwWbnXkPsuQZrgiKPAzg8SDH+LEgXCA9a31TNbWCjAMXOICcUeQBo
 jHlg8Ito3FAriQfYp4mjrzZpBmiXYoJRPZR9yDdBtt8TqbDjAbsD9inF1a9iAEyBrmtE
 L3dtsFEZa/OnSxeUSrCrBSAvD9Cj4/SxtQd9dMiQRQ+HvMChSuSOOWqbETJZsraYcgT1
 7tVg==
X-Gm-Message-State: AOJu0YzuGt5byDqaD953tzbHVrbADA4m4OHLN7hX6AZXfshxz+1sJP1F
 fE19vUiFlHYleE7HGL6+POvNZhN0jvdSmtN71g0Xrq+OGQb+8Wu4267SxsgaansavM9PZ+iq1oM
 5evLFxu2wstXSJu23Hdy7a38WmD9HlR3bw92r09X2cqUcG8DvqxBokDCEbbNvqBGVMlyKcp6sQm
 uu2JPcuZUN2t/S0s29nlBqzLt6502ZkRYJUvi4
X-Gm-Gg: ASbGnctPr51Yn7YCPJd6ufj8YHLOdui8d86TWfqCuh6MpT2EV916PnBPa4CdRa8RrM2
 6+XxK59GLOnbdnIGwz8Toz73sZ0W0QVYAYmDXmDhY+M1XQ7hrLzRVUhtDgvOSCkG7paF2Vw==
X-Received: by 2002:a17:902:d487:b0:224:24d3:60fb with SMTP id
 d9443c01a7336-22c35d26414mr7596505ad.10.1744787094636; 
 Wed, 16 Apr 2025 00:04:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPKom1+vRx4GaPvplnayrdalxFoMiOvH6QisXJ3sz+/iDg9yZneAhpJ3PMOGSA1MNaxLRXaT4klZcvdp00CKw=
X-Received: by 2002:a17:902:d487:b0:224:24d3:60fb with SMTP id
 d9443c01a7336-22c35d26414mr7596275ad.10.1744787094277; Wed, 16 Apr 2025
 00:04:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250415-patchwork_ci-v7-0-bc0b9adca971@suse.com>
 <20250415-patchwork_ci-v7-2-bc0b9adca971@suse.com>
In-Reply-To: <20250415-patchwork_ci-v7-2-bc0b9adca971@suse.com>
Date: Wed, 16 Apr 2025 15:04:42 +0800
X-Gm-Features: ATxdqUE1cQVcLSig8v4ShER7xDc5Cf9PzHcfwMofG0gDqyEbWONpfUNzHMYHu-A
Message-ID: <CAEemH2e3CX4-oW98HhPt7+CaiNf4OYE8k7EkvNnZCV7spuwQmA@mail.gmail.com>
To: Andrea Cervesato <andrea.cervesato@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rXF_5fxG7AcTd343N4H8jvCMPHOGLj8ohurnBiHHi6E_1744787096
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [LTP] [PATCH v7 2/4] ci: add patchwork communication script
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

T24gV2VkLCBBcHIgMTYsIDIwMjUgYXQgMTI6NDDigK9BTSBBbmRyZWEgQ2VydmVzYXRvIDxhbmRy
ZWEuY2VydmVzYXRvQHN1c2UuZGU+Cndyb3RlOgoKPiBGcm9tOiBBbmRyZWEgQ2VydmVzYXRvIDxh
bmRyZWEuY2VydmVzYXRvQHN1c2UuY29tPgo+Cj4gQWRkIGEgc2NyaXB0IHRvIGNvbW11bmljYXRl
IHdpdGggcGF0Y2h3b3JrLiBBdmFpbGFibGUgY29tbWFuZHMgYXJlOgo+Cj4gLSBzdGF0ZTogY2hh
bmdlIHBhdGNoLXNlcmllcyBzdGF0ZQo+IC0gY2hlY2s6IHNlbmQgYSB0ZXN0cyByZXBvcnQgdG8g
cGF0Y2h3b3JrCj4gLSB2ZXJpZnk6IHdpbGwgcHJpbnQgYSBsaXN0IG9mIG5ldyBwYXRjaC1zZXJp
ZXMgd2hpY2ggaGFzIG5vdCBiZWVuCj4gICB0ZXN0ZWQgaW4gdGhlIHBhc3QgaG91ciAoYnkgZGVm
YXVsdCkKPgo+IFRoZSBzY3JpcHQgY2FuIGJlIGNvbmZpZ3VyZWQgZGVmaW5pbmc6Cj4KPiAtIFBB
VENIV09SS19VUkw6IHBhdGNod29yayB1cmwgdG8gY29tbXVuaWNhdGUgd2l0aAo+IC0gUEFUQ0hX
T1JLX1RPS0VOOiBwYXRjaHdvcmsgYXV0aGVudGljYXRpb24gdG9rZW4KPiAtIFBBVENIV09SS19T
SU5DRTogdGltZXNwYW4gaW4gc2Vjb25kcyB3aGVyZSB3ZSB3YW50IHRvIGZldGNoCj4gICBwYXRj
aC1zZXJpZXMKPgo+IFJldmlld2VkLWJ5OiBQZXRyIFZvcmVsIDxwdm9yZWxAc3VzZS5jej4KPiBS
ZXZpZXdlZC1ieTogQ3lyaWwgSHJ1YmlzIDxjaHJ1YmlzQHN1c2UuY3o+Cj4gU2lnbmVkLW9mZi1i
eTogQW5kcmVhIENlcnZlc2F0byA8YW5kcmVhLmNlcnZlc2F0b0BzdXNlLmNvbT4KPiAtLS0KPiAg
Y2kvdG9vbHMvcGF0Y2h3b3JrLnNoIHwgMTczCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysKPgoKTWF5YmUgYmV0dGVyIHRvIG1vdmUgdGhpcyBpbmRl
cGVuZGVudCB0b29sIHRvIHRoZSBzY3JpcHQvIGRpcj8KVGhpcyBjaS90b29scy8gaXMgc28gaGlk
ZGVuIHRoYXQgaXQgY2FuIGVhc2lseSBiZSBvdmVybG9va2VkLgoKCi0tIApSZWdhcmRzLApMaSBX
YW5nCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGlu
Zm8vbHRwCg==
