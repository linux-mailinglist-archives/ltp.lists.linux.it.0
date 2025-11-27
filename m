Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 965D3C8E34B
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Nov 2025 13:11:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1764245508; h=mime-version :
 references : in-reply-to : date : message-id : to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=E/70hNUHXANZxfFO4c1Z9S08zDqwfCU+tSYo2kcMXJw=;
 b=Fdt4EJzJtSpoiBhwJWFjRJ5cqPPLzLTCRFPReOlq37o5M1/IzrBiMGntvRfGTj/uAwCjj
 hrCwTl7AqkWTZt9btJoo9zIxg+bF35bzHr022Jjy0rlJloiXibSX5OcYuvqezITYptB4+fU
 Zx3qzE4XWV0LIfaoLlRgGsoXPwzI8dI=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 08A013CD18E
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Nov 2025 13:11:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BB1463CA7DF
 for <ltp@lists.linux.it>; Thu, 27 Nov 2025 13:11:35 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 2144760079F
 for <ltp@lists.linux.it>; Thu, 27 Nov 2025 13:11:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764245493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fjO5Z4HakDKaqnHJ2clskz2rXROzlvTJMmdz2391MkI=;
 b=gL393tdGjHFlDMKq64UO0SklJrT4aoCPZHWU6pDFiXn3ePGxD8u4fC7Z/qUcClmWxeY94w
 H4MJr9DE/at3bOJNBx4RVyhPS2GZ9ybvEeugLiTFrd5/wj4pW20hc9LnV3dw8tznX1Vtje
 3G+S/+9gCN4Rt2Pf/Nzv/Nr4ipsYgQ8=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-134-MVGykiHnNB6UjURvreEFhA-1; Thu, 27 Nov 2025 07:11:29 -0500
X-MC-Unique: MVGykiHnNB6UjURvreEFhA-1
X-Mimecast-MFC-AGG-ID: MVGykiHnNB6UjURvreEFhA_1764245488
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-bde2e654286so712894a12.3
 for <ltp@lists.linux.it>; Thu, 27 Nov 2025 04:11:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764245488; x=1764850288;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fjO5Z4HakDKaqnHJ2clskz2rXROzlvTJMmdz2391MkI=;
 b=wwNXS55VV4QiLf6haQV8F55TxX64Oy3N4EfTz29HwIrk6PHRH2SkX6h/4s6cdn84jy
 AoRN9piUDG8wGJm63g0DvNPay0ZzzcHAfOncET2YWVAILzjjgLWOljs8okJ8yBc2DAa9
 Iv3aZwn6Wt0J5kMNE7RwA3NVUfTvHuUWFaf0WVvW9fqBg9ba/kP0otlPN7Zl3mXjnt7R
 KANky+BGVUk3eEZoAcjjNX8rpde28xxYvPI7Jrxu3a/IisS/f6Gk2U+XDuqUoILPOSDn
 q0+6Bx9FW3w2wT32+duj5u2HmIGOuOmDEJD6s6cFzVUfoJHv/zdk8efOrs56AM55lw5b
 Q1Sw==
X-Gm-Message-State: AOJu0YxEuCfW6KhTDEXxz7Isxyeyb21rotoAq4CJ9Dsjh4LlBN1SMmWS
 ApwR8B+wMhZ0kaOq4KG1jBT/Kud8D3LktoOjSZXNrWBz262xOwE6XnN9023vxpDvRdLpeTkPULv
 THupsGSnKEOF/avIpHVByPcBMjbBYzM0p8w44ClJ2nsbMjCPmEBgArn+oOm0gooKDPZTUO75hGX
 W7bGNRuIiNUXMYM9MRFvHQK9QWh/Q=
X-Gm-Gg: ASbGncvFWcRfstgZdHSkyuC5Kjpve1EHqYQCmN9zX36NMNIGcbB+yZba9PNTGQ3TPM4
 WmNuUOWu3GSBIVDR19/81fS/KzCD+MHkx20f2cWP8IDWhexdZTRAREqA6U5Y+dgv3VYxO7xbILx
 ulQivDcEJre+MaaeZ+M2YGq6j4KqPfzS6Z4pem2TGRKJO3ZY+eKuZHXutzqplh9BteTks=
X-Received: by 2002:a05:7300:dc8d:b0:2a9:44f9:b074 with SMTP id
 5a478bee46e88-2a944f9b0f2mr6360441eec.5.1764245488262; 
 Thu, 27 Nov 2025 04:11:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+8/NEP5V6Zdr82T73Sk+nkfQBQwbJrd+yg/f00VKa+at314lwds4Yfzj64lNl8o+UI+2E2ySUGYBRACqEhBc=
X-Received: by 2002:a05:7300:dc8d:b0:2a9:44f9:b074 with SMTP id
 5a478bee46e88-2a944f9b0f2mr6360422eec.5.1764245487794; Thu, 27 Nov 2025
 04:11:27 -0800 (PST)
MIME-Version: 1.0
References: <20251127082638.224110-1-pvorel@suse.cz>
 <20251127082638.224110-2-pvorel@suse.cz>
 <CAEemH2cUYekSphFW_uj2w1FzYt3RWXDDnhmQ5TFAyr0T3HFxow@mail.gmail.com>
In-Reply-To: <CAEemH2cUYekSphFW_uj2w1FzYt3RWXDDnhmQ5TFAyr0T3HFxow@mail.gmail.com>
Date: Thu, 27 Nov 2025 20:11:15 +0800
X-Gm-Features: AWmQ_bn1cP50TX3Sl69gm-3EyGTnjpH1dH-Z_TltV6eBLuI0oHK8WgPnQOWNXUw
Message-ID: <CAEemH2e6ivP0rzfTBp5LnZ8n-oe7moqfHszgs2QyYVMUTUQ_wQ@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3d41Ahg8UoOGjV2e5CESShoS-m9y_0nljX8wo6Wn4ZU_1764245488
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [LTP] [PATCH v3 1/4] shell: Add tst_sudo.c helper
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
Cc: selinux@vger.kernel.org, linux-integrity@vger.kernel.org,
 ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gVGh1LCBOb3YgMjcsIDIwMjUgYXQgNzo1N+KAr1BNIExpIFdhbmcgPGxpd2FuZ0ByZWRoYXQu
Y29tPiB3cm90ZToKCj4gSGkgUGV0ciwKPgo+IEkgZmVlbCB0aGF0IHRoZSBmaWxlbmFtZSB0c3Rf
c3Vkby5jIGlzIGEgYml0IG1pc2xlYWRpbmcuIFRoZSBoZWxwZXIKPiBkb2VzbuKAmXQKPiByZXBs
aWNhdGUgc3VkbyBiZWhhdmlvciAoYXV0aGVudGljYXRpb24sIHByaXZpbGVnZSBlc2NhbGF0aW9u
KSwgaXQgc2ltcGx5Cj4gZHJvcHMgZnJvbSByb290IHRvIGEgZml4ZWQgVUlEL0dJRCBiZWZvcmUg
ZXhlY3V0aW5nIGEgY29tbWFuZC4KPgo+IFNvIHJlYWRlcnMgbWF5IGV4cGVjdCBhIOKAnHN1ZG8t
bGlrZeKAnSBlbGV2YXRpb24gd3JhcHBlciB3aGVuLCBob3dldmVyCj4gaXTigJlzIGEgcHJpdmls
ZWdlLWRyb3BwaW5nIHRyYW1wb2xpbmUuCj4KPiBXaGF0IGFib3V0IHJlbmFtaW5nIGl0IHRvOgo+
ICAgdHN0X3J1bmFzLmMsCj4gICB0c3RfcnVuYXNfbm9ib2R5LmMsIG9yCj4gICB0c3RfZHJvcF9w
cml2cy5jPwo+CgoKUGVyc29uYWxseSwgSSBwcmVmZXIgdGhlIHRzdF9ydW5hc19ub2R5LmMgYmVj
YXVzZSBpdCByZWZsZWN0cyB0aGUKZGVmYXVsdCBwcml2aWxlZ2UsCmJ1dCBkdWUgaXQgc3VwcG9y
dHMgdGhlIG1vcmUgZW52IHNvIGNvbnRhaW5zICJzdSIgbWF5YmUgYmV0dGVyOgogIHRzdF9zdV9z
d2l0Y2guYywgdHN0X3N1X2NtZC5jCgoKLS0gClJlZ2FyZHMsCkxpIFdhbmcKCi0tIApNYWlsaW5n
IGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
