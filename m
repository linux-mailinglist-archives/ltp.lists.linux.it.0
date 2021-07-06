Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E972F3BD7FA
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Jul 2021 15:43:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 57C243C9551
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Jul 2021 15:43:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 391DB3C1883
 for <ltp@lists.linux.it>; Tue,  6 Jul 2021 15:43:07 +0200 (CEST)
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9A0391400E7F
 for <ltp@lists.linux.it>; Tue,  6 Jul 2021 15:43:06 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id q18so38358816lfc.7
 for <ltp@lists.linux.it>; Tue, 06 Jul 2021 06:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sZq+hFeaSKi8Ud2jHSMF8uvZB2HzT8jt7+q9udahxik=;
 b=oDLbj9apOhEvXWtr/2OYAsGaca36dgc+tGT6g2sdEdJ/HUznNMCh5uyL6XEx2JiDZV
 dahkNKZbmAZre9GCy6ElO9CUq05srmzZ7Hb1uPS3ZarKBWv0/rMnGINuuNzs411GhIiT
 uw0+PtqH65OqhqACcCJxSoR6KEYxkwOFjBMuWVJ+gBcMpY/07C/xX4376uligD3MOXX7
 DveeEyvj7HqmCcxgpFmEteAI2az3zoTP8nmmVWXqY6zC8iSqaCX0UomXwX5QAlUyK64d
 TA624sOMSpmZWYzGs4L1YMe60j+y4j8c75yIHvIZPxWs4rxbUbJ0/4sm7aN4gml8KFlS
 q4+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sZq+hFeaSKi8Ud2jHSMF8uvZB2HzT8jt7+q9udahxik=;
 b=pc0b4im4bvAhAuiMf2EPojd68DCdVkze7w3tNx62i3WGQHWM0VvRO4Lb3Q0OPelCsg
 IKY7F5SJ7vSsPzLWLPdpWiT/7yIR/DqHa9G3TwW/bscURk0YlgieK3OIZ337meh8PtYB
 Lcpi3vCJAFmFxXwM6IYstw+BZ1s3KGvmvFgnIw6qJ9g6X2lTIM8z9InBvvS2fx7Lhmnl
 LzrgxAX3bp9+kJB6atP27LgCRoqccXIgALZmJiDELUSf/yJCz7MaO/pmTOUMA//8P9vT
 TPg2Ptxai3QnMoeLw5ddqIs21jGcSpe9fnz9IePp9m4xKzOzQ314zzcMJkgY6Tg/mJTG
 KLsg==
X-Gm-Message-State: AOAM5303Q2x39nO3m6O7pcvKkVeEzLIIOX3wywIcLd51X5uk0+Jnj+n3
 Y9+Ejgusg/52msGJ1XNLnxs5
X-Google-Smtp-Source: ABdhPJx8HxNDEayf4XcvMauIwE9bMM7o/hTHMFobzfj67ej6oF7v5JH5l6yZ8MWzpLfvRo3LJ38v4g==
X-Received: by 2002:a05:6512:991:: with SMTP id
 w17mr14627083lft.57.1625578985952; 
 Tue, 06 Jul 2021 06:43:05 -0700 (PDT)
Received: from [192.168.1.53] ([91.247.148.5])
 by smtp.gmail.com with ESMTPSA id c16sm1403011lfi.18.2021.07.06.06.43.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 06:43:05 -0700 (PDT)
To: Li Wang <liwang@redhat.com>
References: <20210706105758.43220-1-aleksei.kodanev@bell-sw.com>
 <CAEemH2cOm+1BMWE7oWVFttXNOeQsYk9veXePS+ctxAABk2rCWQ@mail.gmail.com>
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <c2c7ff46-df28-c7b6-49dd-c891d9655d00@bell-sw.com>
Date: Tue, 6 Jul 2021 16:43:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAEemH2cOm+1BMWE7oWVFttXNOeQsYk9veXePS+ctxAABk2rCWQ@mail.gmail.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] shmget03: fix test when some shm segments already
 exist
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
Cc: LTP List <ltp@lists.linux.it>, Huanian Li <huanli@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgTGksCk9uIDA2LjA3LjIwMjEgMTU6NDksIExpIFdhbmcgd3JvdGU6Cj4gSGkgQWxleGV5LAo+
IAo+IE9uIFR1ZSwgSnVsIDYsIDIwMjEgYXQgNjo1OSBQTSBBbGV4ZXkgS29kYW5ldiA8YWxla3Nl
aS5rb2RhbmV2QGJlbGwtc3cuY29tIDxtYWlsdG86YWxla3NlaS5rb2RhbmV2QGJlbGwtc3cuY29t
Pj4gd3JvdGU6Cj4gCj4gICAgIEl0J3MgdW5saWtlbHksIGJ1dCBzdGlsbCBwb3NzaWJsZSB0aGF0
IHNvbWUgb2YgdGhlbSBjb3VsZCBiZQo+ICAgICBjcmVhdGVkIGR1cmluZyB0aGUgdGVzdCBhcyB3
ZWxsLCBzbyB0aGUgcGF0Y2ggb25seSBjaGVja3MKPiAgICAgZXJybm8uCj4gCj4gCj4gVGhhbmtz
IGZvciBmaXhpbmcgdGhpcywgc2VlbXMgdGhlIG1zZ2dldDAzIGhhcyB0aGlzIHByb2JsZW0gYXMg
d2VsbC4KPiBodHRwczovL2dpdGh1Yi5jb20vbGludXgtdGVzdC1wcm9qZWN0L2x0cC9pc3N1ZXMv
ODQyIDxodHRwczovL2dpdGh1Yi5jb20vbGludXgtdGVzdC1wcm9qZWN0L2x0cC9pc3N1ZXMvODQy
PgoKWWVzLCBpdCBpcyB0aGUgc2FtZSwgaXQgY2FuIGJlIGVhc2lseSByZXByb2R1Y2VkOgoKJCAu
L21zZ2dldDAzCnRzdF90ZXN0LmM6MTMxMTogVElORk86IFRpbWVvdXQgcGVyIHJ1biBpcyAwaCAw
NW0gMDBzCm1zZ2dldDAzLmM6NTA6IFRJTkZPOiBUaGUgbWF4aW11bSBudW1iZXIgb2YgbWVzc2Fn
ZSBxdWV1ZXMgKDMyMDAwKSByZWFjaGVkCm1zZ2dldDAzLmM6Mjk6IFRQQVNTOiBtc2dnZXQoMTYy
NzQ5MTY2MCwgMTUzNikgOiBFTk9TUEMgKDI4KQoKJCBpcGNtayAtUQpNZXNzYWdlIHF1ZXVlIGlk
OiAzMjc2OAoKJCAuL21zZ2dldDAzCnRzdF90ZXN0LmM6MTMxMTogVElORk86IFRpbWVvdXQgcGVy
IHJ1biBpcyAwaCAwNW0gMDBzCm1zZ2dldDAzLmM6NDY6IFRCUk9LOiBtc2dnZXQgZmFpbGVkIHVu
ZXhwZWN0ZWRseTogRU5PU1BDICgyOCkKCgpXZSBjYW4gZml4IGl0IHNpbWlsYXJseS4KCj4gCj4g
Cj4gICAgIFNpZ25lZC1vZmYtYnk6IEFsZXhleSBLb2RhbmV2IDxhbGVrc2VpLmtvZGFuZXZAYmVs
bC1zdy5jb20gPG1haWx0bzphbGVrc2VpLmtvZGFuZXZAYmVsbC1zdy5jb20+Pgo+IAo+IMKgUmV2
aWV3ZWQtYnk6IExpIFdhbmcgPGxpd2FuZ0ByZWRoYXQuY29tIDxtYWlsdG86bGl3YW5nQHJlZGhh
dC5jb20+Pgo+IAo+IC0tIAo+IFJlZ2FyZHMsCj4gTGkgV2FuZwoKCi0tIApNYWlsaW5nIGxpc3Qg
aW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
