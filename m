Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAA5E48D4
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Oct 2019 12:49:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4F92A3C2274
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Oct 2019 12:49:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 63F0E3C1860
 for <ltp@lists.linux.it>; Thu, 24 Oct 2019 20:20:08 +0200 (CEST)
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id B89041401750
 for <ltp@lists.linux.it>; Thu, 24 Oct 2019 20:20:07 +0200 (CEST)
Received: by mail-qt1-x844.google.com with SMTP id z22so18750509qtq.11
 for <ltp@lists.linux.it>; Thu, 24 Oct 2019 11:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=YHxw/1jGqaSBr3k4wmSS8cvXYEwgfMv2jjCpj8Ti9BU=;
 b=k5crps8DS3wPfJ9fKd27AId15T9Eo/o+EWv2YQJ20fpZZrzexH5WTG+8gTBBIOsejG
 f8VlHtHlLf9Qf2zZwNztpn4wUgJu8gsGxySwycQ9F2lwPmo0RhABh6vKSPT23R4jptNv
 2gm9eqrr0uqo22Kh/TTSmunT3DG8IwNCpRrX9M4nfM6K4Oo2PbmNYS2hRit5uXUzQ5ty
 UMzQja3JazqozHU34RXFk4r8XsIzOdJWBK3DIaZb5Mh/qgRvAzLK69I33CDI1fMFXOSa
 FUjKmGsgrQTYOfypnXMyUZizzdn1ws4675olskDtBh1U+Qy8xutQ8dSKGoHn/caUKxbp
 gp6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YHxw/1jGqaSBr3k4wmSS8cvXYEwgfMv2jjCpj8Ti9BU=;
 b=NjP96M2NtyISuIi0ErvHkYxotKcOBhdKk36M+b0lHzfzg7J+nViKM9I1J1TAsesETC
 HXXAimhxEqYihkrdOPbxQTqc086NOJQHEMjUVbk/IdC7r0Eoxcr8GZ73WfKONkRXgmmI
 EFHQuiYK+DoM1ge1Py8m0zuiqFdfw/fnjDFdpSq1h3nquKVPllgli7OPIakdJFCruyYz
 kKNA8oO++tYnGCXYis25PmAGSlgPQvC3SxLoPxy8WHRVNgK/REGrxPtn/cNIoZEWvHNF
 crm/nGqWKGMa/Bnopo6dXaMYYBY7G5AIMI9GOmnDvLoeeXIWAqutbOsdASyrFmPrWkpq
 BIrw==
X-Gm-Message-State: APjAAAVKfzAlcIBMcQzT9rE+3NAQpnv9LWyIsn7twxmjoYq00trdswsp
 LbOMQD4I8ZBekbb0F4BWMA3WDw==
X-Google-Smtp-Source: APXvYqzYGvB9lyLOAokJnp0KMY9tslvin0Gd8Mi3CWHmu38LyonkVq0A6NJq6BEkCK91t9OLDKo11w==
X-Received: by 2002:a0c:8144:: with SMTP id 62mr16232469qvc.6.1571941206391;
 Thu, 24 Oct 2019 11:20:06 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.180])
 by smtp.gmail.com with ESMTPSA id c23sm18287416qte.66.2019.10.24.11.20.05
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 24 Oct 2019 11:20:05 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iNhiP-0001BP-Ei; Thu, 24 Oct 2019 15:20:05 -0300
Date: Thu, 24 Oct 2019 15:20:05 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Message-ID: <20191024182005.GZ23952@ziepe.ca>
References: <1558041162.3971.2.camel@linux.ibm.com>
 <fccc3abd-f3ce-fdb1-55d7-c18ce116446c@linux.vnet.ibm.com>
 <20190517150456.GA11796@dell5510> <20191024121848.GA5908@dell5510>
 <20191024172023.GA7948@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191024172023.GA7948@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
X-Mailman-Approved-At: Fri, 25 Oct 2019 12:49:13 +0200
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
Cc: Nayna <nayna@linux.vnet.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>,
 ltp@lists.linux.it, linux-integrity <linux-integrity@vger.kernel.org>,
 Peter Huewe <peterhuewe@gmx.de>,
 Piotr =?utf-8?B?S3LDs2w=?= <piotr.krol@3mdeb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Oct 24, 2019 at 08:20:23PM +0300, Jarkko Sakkinen wrote:
> Also replicants for durations and timeouts files would make sense for
> TPM 2.0.

These ones don't meet the sysfs standard of one value per file, which
is why they didn't make it to tpm2

Jason

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
