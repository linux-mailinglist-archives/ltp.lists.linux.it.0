Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CC9E4F1B
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Oct 2019 16:29:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B9E7B3C22BF
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Oct 2019 16:29:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 5A7FF3C2262
 for <ltp@lists.linux.it>; Fri, 25 Oct 2019 16:29:30 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id CA5D8600BC4
 for <ltp@lists.linux.it>; Fri, 25 Oct 2019 16:29:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572013762;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iKhhUZoR3ETcndZCkdmFNE8ChoQ3VU6czGoP+SADhxw=;
 b=P5XJXKgsOHVK4xh44yYOKaZPzUk6KD+zpszWNB7R4rU1HhxTEGCYcXF9wrXICC4QiVynx2
 pw6vFCwPL9hXEUEyoMxmVEdV/65SpEOFh+gO8XxA77U4kRBFw/b26vQshVjzlZTteGMdr0
 Uk0CAUpQre931PPrlB3648/1ZQm26UU=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-JiluvlwcPB-uUSI8H6beeA-1; Fri, 25 Oct 2019 10:13:49 -0400
Received: by mail-pf1-f199.google.com with SMTP id y191so1985434pfg.17
 for <ltp@lists.linux.it>; Fri, 25 Oct 2019 07:13:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=X+e8SRli7RIXuNIpLGcbbLLRwOMtP8b1dDWnVykEWd8=;
 b=UfNxrC6eAW/bFQjZtW4caRCM2dBmSwg9Iv67rbRCW1CCAc/wObSPMROp+aZ2b5ij8Z
 A/I4tIR/bL5S/Tmmg31o/G8pNWZJ0gLjxOqiHveAS+OmFRorZz+Qfin1dwGOYqe9z+d1
 as3MbDe3x2n1vxHh5setAHRNyApHV6DI7JhgtOgqIY3jgU/S/Hu0/1yCTt+5yZ1JxRfO
 1/Y8ECDHdGhfoeNiN6UBgu7yHtigdsCUm6t84QdcssvsjtTDtP5deNSN5/02U7udN4TO
 OMLi/vBoSw9eLmIYzZIJzOvxTEyBCB55rmoGeZL5zzK9UZRW8SoC0rE+MEtKCTYa6utt
 SpVg==
X-Gm-Message-State: APjAAAUuzBIc4wFRsu03L9aU+ZbIR4ftToJTMABHYq9WCosdiqljQ6Ac
 RIt2jYF4Z1P5ptlqsNsPHAClYUhbob78BiDTDpaFpc+boGGKFmrX2IsF4ko+Eh5EScWKr7b0EeS
 4F5/ESYUg5rY=
X-Received: by 2002:a17:902:930b:: with SMTP id
 bc11mr4112130plb.284.1572012828061; 
 Fri, 25 Oct 2019 07:13:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw9k9KnbOJwB4/FRHSgZ+Ocoy9VruYqrc0rVKQ5nE7UqMIMmehiCscqeRU+ui7pdmzchKD1EA==
X-Received: by 2002:a17:902:930b:: with SMTP id
 bc11mr4112101plb.284.1572012827821; 
 Fri, 25 Oct 2019 07:13:47 -0700 (PDT)
Received: from localhost (ip70-163-223-149.ph.ph.cox.net. [70.163.223.149])
 by smtp.gmail.com with ESMTPSA id 27sm2661444pgx.23.2019.10.25.07.13.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 07:13:46 -0700 (PDT)
Date: Fri, 25 Oct 2019 07:13:45 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20191025141345.46ifshskk2vpxi2t@cantor>
References: <1558041162.3971.2.camel@linux.ibm.com>
 <fccc3abd-f3ce-fdb1-55d7-c18ce116446c@linux.vnet.ibm.com>
 <20190517150456.GA11796@dell5510> <20191024121848.GA5908@dell5510>
 <20191024172023.GA7948@linux.intel.com>
 <20191024213842.c6cl4tlnsi56pgcy@cantor>
 <1571964420.5173.12.camel@linux.ibm.com>
 <20191025021159.dt7ifgnebnke6ca7@cantor>
 <20191025085617.GA13329@x230>
MIME-Version: 1.0
In-Reply-To: <20191025085617.GA13329@x230>
User-Agent: NeoMutt/20180716
X-MC-Unique: JiluvlwcPB-uUSI8H6beeA-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] ima: skip verifying TPM 2.0 PCR values
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
Reply-To: Jerry Snitselaar <jsnitsel@redhat.com>
Cc: Nayna <nayna@linux.vnet.ibm.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, ltp@lists.linux.it,
 linux-integrity <linux-integrity@vger.kernel.org>,
 Mimi Zohar <zohar@linux.ibm.com>, Peter Huewe <peterhuewe@gmx.de>,
 Piotr =?utf-8?B?S3LDs2w=?= <piotr.krol@3mdeb.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri Oct 25 19, Petr Vorel wrote:
>Hi,
>
>> /sys/kernel/security/tpmX/major_version (on fedora and rhel at least, is it elsewhere on other distros?)
>
>> versus
>
>> /sys/class/tpm/tpmX/major_version
>
>Is it more HW related (/sys/class/tpm/tpmX) or LSM related
>(/sys/kernel/security/tpmX)?
>I guess /sys/kernel/security/tpmX might be better.
>

I think it is HW related since it is describing the
TCG version that the chip implements.

>Thanks for implementing this, I'll try to test it soon.
>
>Kind regards,
>Petr


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
