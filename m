Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECB79A8B2
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Aug 2019 09:23:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E2AD83C1D44
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Aug 2019 09:23:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 235533C1770
 for <ltp@lists.linux.it>; Fri, 23 Aug 2019 09:23:25 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id AB4762011AA
 for <ltp@lists.linux.it>; Fri, 23 Aug 2019 09:23:24 +0200 (CEST)
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B54D5369CA
 for <ltp@lists.linux.it>; Fri, 23 Aug 2019 07:23:22 +0000 (UTC)
Received: by mail-vk1-f198.google.com with SMTP id v63so3348308vkb.18
 for <ltp@lists.linux.it>; Fri, 23 Aug 2019 00:23:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0RGEtsd1b+mkbc3GCgyE+toe3aH+7rMtG5/ihiyflT4=;
 b=i6SrXRn+CGO3ZPIJWDjmFT7h//uOVABBiLI5WMEs/6YYDVaoQgLS2PvFL/G5aXlUKw
 +WeZyQtWKuLLKu+Q4Ty9BrGHblJ2YmjsGuJ4SjfYcD0564ts8Tsoaz0RrbhES+OEYBfu
 3W3blnvSvMgqdYUPbA8DrB5fTqTMFYteeJNnWkHEWd3nhY0mTWH+Zm16xOJQe1DXKSzg
 kxSWByOFOKzT0r/Ua+uDH+d4IniVFpoIkVir2g1u904X3ZQtRoER00bkwnWo8Jn1ZSYw
 3YxNpPrdCZQmCEYLca0zwP7g1y+5RjWRycjXekNVq+8s7KLSeW8ccskGGjMgV0tW6JP0
 LJBA==
X-Gm-Message-State: APjAAAVQx6nY3BAHSHp9yEsaIhB1IX46jmhOyckXvRr0qQ+g68qrcjXQ
 jw9eanmdX1qU/hlHFby/5RfJYPzJFI7O0Fa1NZ7j1IGKyWVbpCJ+ncDc9lHUDC5AwERhk6g0Qa9
 Gi7dF3N55vSHc1g7nFRnmbNWL16k=
X-Received: by 2002:ab0:73da:: with SMTP id m26mr1775099uaq.119.1566545001719; 
 Fri, 23 Aug 2019 00:23:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzZYQRVckcWde1hjnJ1CjBKOAYhW8mi0VmTBxqFDzcJxgYy2Dxr2p29pjJxR/DzdFkDZRBkq/VBQt3L64A7wlQ=
X-Received: by 2002:ab0:73da:: with SMTP id m26mr1775095uaq.119.1566545001432; 
 Fri, 23 Aug 2019 00:23:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190815083630.26975-1-pvorel@suse.cz>
In-Reply-To: <20190815083630.26975-1-pvorel@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Fri, 23 Aug 2019 15:23:10 +0800
Message-ID: <CAEemH2dcWnuwDzTjguCYao=H+xFkUZ4BYKOiNYAGNGZo4JHA2Q@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lapi/fs.h: Replace MAX_LFS_FILESIZE constant with
 own implementation
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

Pushed. Thanks for the fix.

-- 
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
