Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0208B361CDF
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Apr 2021 11:47:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B96EB3C1CBE
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Apr 2021 11:47:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B18BA3C1AB6
 for <ltp@lists.linux.it>; Fri, 16 Apr 2021 11:47:21 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 21E7F10005C3
 for <ltp@lists.linux.it>; Fri, 16 Apr 2021 11:47:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618566439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q2FctzH3RekoATYk+fs/sO8qHW3EfOnd4DwYIqumthI=;
 b=QohqKXTUYzg4wH3S4aXejLbc5M5FtaJNF8yzzJ1Ze8oG3SDJlTFAI0QyKmyu993qJPtJiz
 wC/ucqjTjmFUXTg3pfJmk6JnpRiMxRxSogv5B7edHeQzoePCf+wipAWlAckLb/DxlBKr1v
 QKSGjxYBkKFBhUP0Vsy1Sc4W8r5Mn3o=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-CUiMtTMWOaCw9DUdgDOGZg-1; Fri, 16 Apr 2021 05:47:18 -0400
X-MC-Unique: CUiMtTMWOaCw9DUdgDOGZg-1
Received: by mail-yb1-f198.google.com with SMTP id i2so5533300ybl.21
 for <ltp@lists.linux.it>; Fri, 16 Apr 2021 02:47:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q2FctzH3RekoATYk+fs/sO8qHW3EfOnd4DwYIqumthI=;
 b=bNXhKLXEDZIFsoQA2SkenhFWN4g2kb2UxkLNVB6rXaIQ/RPpcvC7ltwS2ykqcvwIJ/
 HlB3drIJwRr7T5a5qwxo2P/+kLVHPIcocLAR6y93ZoZoAotk7Nwl2tn4b8dLYFqgflvX
 vkGkbIAyCWDNwx2Alw1p0Ws3/yDttoQxedWhxM5QPQUkPVzhA7Eoe4uqfqewBi7yaYrK
 iE126o0Bsrze0hPDp9XAo13S3Pdi3PZImSBTksB+vwScc6Ul/5kjg2Hsu4XzsElF+8hQ
 b9cNNL1BkPYGqWr37CtM2lQC64A+eIv1zjqxCP+9XF187KRCJzvRvRmEdRmmnZXB2Gww
 LgJg==
X-Gm-Message-State: AOAM531Nai9OR943heDMqn5xpTygKCC+LR3FW9fkYGjiLuq4ESVdXBxv
 ZkMhkPKkgLvIxP1ChI6aX/df/NR9NR/OcaFJ7jsU75mgOtOmRdHSK2/1xP3OqPt5jOVGtgFQqGb
 uEPrK/QCysCF0fCUvZgqddPEpMC0=
X-Received: by 2002:a25:d70f:: with SMTP id o15mr10058085ybg.403.1618566437611; 
 Fri, 16 Apr 2021 02:47:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpMFJTvaBYT8y438FZBqhw6UPuanVABgXdynme+zjwj1Ve28xk3UIIzjgSwuI91ZlDArFf86JWg2pqlsnmHOY=
X-Received: by 2002:a25:d70f:: with SMTP id o15mr10058071ybg.403.1618566437450; 
 Fri, 16 Apr 2021 02:47:17 -0700 (PDT)
MIME-Version: 1.0
References: <720dd61b04bf13974f9e3d69bfec5dc9a02a9e8d.1618562750.git.jstancek@redhat.com>
 <YHlZhXA/PnBnJ+hI@yuki>
In-Reply-To: <YHlZhXA/PnBnJ+hI@yuki>
From: Li Wang <liwang@redhat.com>
Date: Fri, 16 Apr 2021 17:47:06 +0800
Message-ID: <CAEemH2cceqCGLTpRuOX+jx85KxstGf4dT3op11dME0jpwDXzhQ@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] commands/ld01: relax check for missing files
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, Apr 16, 2021 at 5:42 PM Cyril Hrubis <chrubis@suse.cz> wrote:
>
> Hi!
> Acked-by: Cyril Hrubis <chrubis@suse.cz>

Pushed.

-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
