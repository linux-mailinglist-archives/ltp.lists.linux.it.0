Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C02FB388BAD
	for <lists+linux-ltp@lfdr.de>; Wed, 19 May 2021 12:29:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EF4753C3193
	for <lists+linux-ltp@lfdr.de>; Wed, 19 May 2021 12:29:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0415E3C304B
 for <ltp@lists.linux.it>; Wed, 19 May 2021 12:29:30 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id DF857600702
 for <ltp@lists.linux.it>; Wed, 19 May 2021 12:29:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621420168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M9qEsBqMsPOdsCgg3XMzCWWrmSTsIS8/3qIrstg8ygY=;
 b=Xdr761SxYt/5e9nAgffYfMQgjBJpLqQUlFPXu7FSrJoOwa4t37gUnAqjBDo/5VKsD+hD43
 n0ks02iHcWSCwsNIBvVROv5pHbQiIn6yaIe994UFQ+QwOKOVx97ZUQ8WLzSUJbUBlZLJuM
 Rvrg64Drx2J2aOXTptqSR1WaTGNGhoo=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-2C3cgFq2NZ6mTyxSPgGhRg-1; Wed, 19 May 2021 06:29:24 -0400
X-MC-Unique: 2C3cgFq2NZ6mTyxSPgGhRg-1
Received: by mail-yb1-f198.google.com with SMTP id
 e138-20020a25e7900000b029050df4b648fcso11170050ybh.7
 for <ltp@lists.linux.it>; Wed, 19 May 2021 03:29:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=M9qEsBqMsPOdsCgg3XMzCWWrmSTsIS8/3qIrstg8ygY=;
 b=XJwjJmKhBjGXUoi/9HHKclBZsK3ms0NRitFvUR2tmF31T8Ljfc20ol6rQDgw31r+1W
 nOsPpym6wUzoNSrARYAspw7NjmWcyv6GAmps/Ar45fpUmByFsGTbDVF8FiZ9FTmK7XC/
 jBDZTOEAMQGp282lK3rZ2RyISg2XMVr3JPudUbY/WArdib7NgXxY6Zp0iDsOAsfMmZwv
 G3LuaQBPKMGSb6axfkEgxNbtLvvu9//mYhnntEJyKTwhqAVrTk3gBHxZItMxurllKdNy
 4l7LfVFOSzBZ65rO4SRYyGhDiK95WM/MMcA2hMxIrw25qFDOGvNPQ/34kAUTjXh+Y03J
 3DhA==
X-Gm-Message-State: AOAM531QqZGsElfAO0ieu7qH/V26AaOo9c8MPnTFkUYfMHSGCZ1TTS4G
 gfWdi0fl2P/5hjCdhcP505A0RV8P3kROotuD9msdGgUJgSAzQBiiT05kQlwKwUaP4OJUwy8y6La
 47JTb1J5gwOhNqLW1qoGS5702UZk=
X-Received: by 2002:a25:b44d:: with SMTP id c13mr13793537ybg.86.1621420164257; 
 Wed, 19 May 2021 03:29:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8XfpJeMr9n6P9heZfwkYo5nSITZMDxvjPWnL6SeVSg1UmVbEYhZjT3hoZFzPiQD181ndoXomFbOJaThi7Ru4=
X-Received: by 2002:a25:b44d:: with SMTP id c13mr13793517ybg.86.1621420164081; 
 Wed, 19 May 2021 03:29:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210519063109.224352-1-lkml@jv-coder.de>
 <CAEemH2fcuMtZgthknbsLKHdhqq7NrtB=nm6Oi9pvxG6MH0_jsQ@mail.gmail.com>
 <8555aa72-3288-c1a9-d6f1-3998c15d630e@jv-coder.de>
In-Reply-To: <8555aa72-3288-c1a9-d6f1-3998c15d630e@jv-coder.de>
From: Li Wang <liwang@redhat.com>
Date: Wed, 19 May 2021 18:29:12 +0800
Message-ID: <CAEemH2e5cdb4G=cpV3amf=-JaeVGBDpC7WX4YTubF7wzr3FNDg@mail.gmail.com>
To: Joerg Vehlow <lkml@jv-coder.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] shell: Fix timeout process termination for zsh
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

PiBJIG1heSBoYXZlIHNvbWV0aGluZyB0byBkbyB3aXRoIHN1YnNoZWxscyBhZ2Fpbi4uLgo+IEkg
anVzdCB0d2Vha2VkIHlvdXIgcmVwcm9kdWNlciwgdG8gYmUgYSBiaXQgbW9yZSBsaWtlIG91ciAi
cmVhbAo+IHNjZW5hcmlvIiBhbmQgY2FuIHJlcHJvZHVjZSBpdDoKClllcywgSSBjYW4gcmVwcm9k
dWNlIGl0IG5vdy4KCj4KPiB0aW1lb3V0KCkKPiB7Cj4gICAgICBzbGVlcCAxMDAgJgo+ICAgICAg
c2xlZXBfcGlkPSQhCj4gICAgICB0cmFwICJlY2hvIFJlY2VpdmVkIFRFUk07IGtpbGwgJHNsZWVw
X3BpZDsgZXhpdDsiIFRFUk0KPiAgICAgIHdhaXQgJHNsZWVwX3BpZAo+ICAgICAgWyAkPyAtZXEg
MTQzIF0gJiYgZWNobyAiRkFJTCIKPiB9Cj4KPiB0aW1lb3V0ICYKPiBwaWQ9JCEKPiBzbGVlcCAx
Cj4ga2lsbCAkcGlkCj4KPgo+ICQgYmFzaCB0ZXN0LnNoCj4gUmVjZWl2ZWQgVEVSTQo+Cj4gJCB6
c2ggdGVzdC5zaAo+IFJlY2VpdmVkIFRFUk0KPiBGQUlMCj4KPiBKw7ZyZwo+Cj4KCgotLSAKUmVn
YXJkcywKTGkgV2FuZwoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51
eC5pdC9saXN0aW5mby9sdHAK
