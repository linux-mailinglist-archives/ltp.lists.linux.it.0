Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6CE77D74C
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Aug 2023 03:01:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AB3F93CCE5B
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Aug 2023 03:01:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3EDC13CA2BB
 for <ltp@lists.linux.it>; Wed, 16 Aug 2023 03:01:35 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6E8341400184
 for <ltp@lists.linux.it>; Wed, 16 Aug 2023 03:01:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692147692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LS4A/QRwH1EYEjGjbQ3o2qtKBleHQZYQ8fBUNmXNunA=;
 b=Y1AL1Q+7BE9XJLDQ+LX+Iyp/boxR7TtS6DkZOgpgYC/Lkw+oSpyX59zfqxVL+gE9S+hrRy
 3O1DCQ5+TY13Ov8z9V9tDU/PJNX3lPZp17aS2ZaIv8lvmlaWPHdZuqHFeqtCSHfsBhrPlc
 TqQBsMkB0rAjwiBJv3FBIIUMq0caqWI=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-1sloWlzrO_-4D91MWwYvPg-1; Tue, 15 Aug 2023 21:01:30 -0400
X-MC-Unique: 1sloWlzrO_-4D91MWwYvPg-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2ba1949656bso58478531fa.0
 for <ltp@lists.linux.it>; Tue, 15 Aug 2023 18:01:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692147689; x=1692752489;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LS4A/QRwH1EYEjGjbQ3o2qtKBleHQZYQ8fBUNmXNunA=;
 b=k8boNWe3YT6iNvoSEAXxVBtNIFZQpz+zDE9ZiAvBPppPwTa60SN6Gudtx0gkAu7UA7
 Gc6zHuYkQG4S0q/nTf68yBQ4aQ+LtzE3h+O4PfhQGHVe+Ix/r2C52ey5AmySSggRwzQi
 wBTpLcVjYXxiV2fza/agU1whtyi9gBGQsjVlfEtsmlmQTs1zOENs708LhhSgVxYytJ4D
 6+qwTR6i991AoA62bVVFiRjyT9aoSmtJJ6P5JBLKXtWsPNYAiDUx3jUL2O/jqyHqk4yX
 YjQDbTugZxOLxH8Wc89O3ipfoeZ21U20NjbuO3S8VwjcLrZJLNUU47lUdiJmXYgvOTgn
 braQ==
X-Gm-Message-State: AOJu0YzuGas5afUgAGhl+RLEVMVu999bHjFvcYVEBWT4tBlWcIkhW2CM
 8/9cCkKtRwNWrLjdXLL9Ynfdb65Zw2XsGA3OBN6D+qjFcdunUHuqMo6juTNUWp35v0voavXcEF9
 ZCQ2XmiwIjaIXySZdHPXeoX8zMJE=
X-Received: by 2002:a2e:995a:0:b0:2b5:9f54:e28b with SMTP id
 r26-20020a2e995a000000b002b59f54e28bmr335989ljj.7.1692147689434; 
 Tue, 15 Aug 2023 18:01:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGp2/Zpu8EeOUu2VlP14cGn9h6x+hbPu3KzjeAJKArPIFEbZsAii10giTp/Cn+YczDO59bF/LDC6j9NyQfiOfo=
X-Received: by 2002:a2e:995a:0:b0:2b5:9f54:e28b with SMTP id
 r26-20020a2e995a000000b002b59f54e28bmr335977ljj.7.1692147689110; Tue, 15 Aug
 2023 18:01:29 -0700 (PDT)
MIME-Version: 1.0
References: <1692096817-15512-1-git-send-email-xuyang2018.jy@fujitsu.com>
In-Reply-To: <1692096817-15512-1-git-send-email-xuyang2018.jy@fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 16 Aug 2023 09:01:17 +0800
Message-ID: <CAEemH2eekEz2=ec7474rRAjYYLO34iWczFsmKXRUoxkz04uNhA@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@fujitsu.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 1.0.1 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [LTP] [PATCH]
 build-system-guide.txt/c-test-api.txt/c-test-tutorial-simple.txt/c-test-tutorial-simple.txt:
 fix typo
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

Pushed, thanks!

-- 
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
