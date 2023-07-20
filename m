Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CD275A4D5
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Jul 2023 05:40:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C58313CDCFD
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Jul 2023 05:40:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4B3E43C02C7
 for <ltp@lists.linux.it>; Thu, 20 Jul 2023 05:40:29 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 693AE1A00994
 for <ltp@lists.linux.it>; Thu, 20 Jul 2023 05:40:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689824426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D6JeTFfHCPUEYeA7OZT6F+OUE0WLrKUMtDhjfVr8NQQ=;
 b=XSINL1RBOLL8cn736l1XBj4k3ZW+oBz38WWn/bnhCN3L/ZpJQ2jRiNCX9yYSCRWe9bN2qJ
 zPoxp9VN0ZsjmLdgJPokuYMyKZwfKmQEZiufAVUugsvccsnqeRWi3kiurWhV2RhYksVooQ
 U31YIegFFzJ85Aw5HCNAd+RJahj0h+o=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-252-8i40pOaDNZWp9sT8F6mlcA-1; Wed, 19 Jul 2023 23:40:24 -0400
X-MC-Unique: 8i40pOaDNZWp9sT8F6mlcA-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2b704f6bbeaso3299701fa.2
 for <ltp@lists.linux.it>; Wed, 19 Jul 2023 20:40:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689824422; x=1692416422;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D6JeTFfHCPUEYeA7OZT6F+OUE0WLrKUMtDhjfVr8NQQ=;
 b=c7Q3lWk5q3uA4DFLlqyiqubNRd9hadjy3Syl2EY3iD1WZT+Qk48kKLJOmviXaQReZY
 VlZtn/vrJ3x+s3+gSCE8QUCuJWKkPmogYYu5tPcqTVf9U1Q/RJRaHcEM6X+duyEHN93C
 mVt5rPh1Wfg5hMvrcNLzxstanQ/MSk277QG4C01HkHMVigxtfXSzwNY6EedYQsUfKu/5
 4a8A7l4PJwGP5VvFGQORJGS7KJeXOMJQgaoiiJ8UnthvX52AhhFlxsGR41PV3obDJHVj
 QSm3fDPHeKJJGpYRAjAZjkiilhPDwq13Cy/KANsgjE6pHmz1NG1f7zBD+NM3aFw20W4t
 WagQ==
X-Gm-Message-State: ABy/qLbDj3o3l2q5fs9gcn9hkH19bJiX7RA/qHWuLGxh8BRY5HSDhjz8
 hEyvViy3PIasAFV+OroTUfjSxN5UA5bPIyS80n4gp9ARd2xQbH3THRVVXHZnPjQxOhddWiSdQdJ
 qNwOCLEDKbaaSvjGpQD9fc/ML+iXWyIoEIQo=
X-Received: by 2002:a2e:9947:0:b0:2b9:344c:a214 with SMTP id
 r7-20020a2e9947000000b002b9344ca214mr1195596ljj.42.1689824422640; 
 Wed, 19 Jul 2023 20:40:22 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGb7t+9DToDU8+FcXRJLPDyv0HPz2//NAOZtUpitsgGSctWEgA8FaaLCOodUOQBFhEHW1dHyVS7BNg7QVOQeRM=
X-Received: by 2002:a2e:9947:0:b0:2b9:344c:a214 with SMTP id
 r7-20020a2e9947000000b002b9344ca214mr1195587ljj.42.1689824422327; Wed, 19 Jul
 2023 20:40:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230719085529.8886-1-mdoucha@suse.cz>
 <CAEemH2ee36=NQCvNZ+fwj2=mkG+Bx7doSudsJw_qqnRijMXyWw@mail.gmail.com>
In-Reply-To: <CAEemH2ee36=NQCvNZ+fwj2=mkG+Bx7doSudsJw_qqnRijMXyWw@mail.gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 20 Jul 2023 11:40:10 +0800
Message-ID: <CAEemH2fm_mHhQ-vOGgfr8gdX0AmNMCuVF_M=hjNnOYyZO8vP7Q@mail.gmail.com>
To: Martin Doucha <mdoucha@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 1.0.1 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [LTP] [PATCH] cpuset_memory_testset.sh: Fix syntax error when
 hugepages not supported
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Patch merged, thanks!

-- 
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
