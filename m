Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CE096E48D9
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Oct 2019 12:49:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 829BD3C228D
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Oct 2019 12:49:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 095643C1CAA
 for <ltp@lists.linux.it>; Fri, 25 Oct 2019 01:36:05 +0200 (CEST)
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 833B61000960
 for <ltp@lists.linux.it>; Fri, 25 Oct 2019 01:36:04 +0200 (CEST)
Received: by mail-qk1-x742.google.com with SMTP id a194so78205qkg.10
 for <ltp@lists.linux.it>; Thu, 24 Oct 2019 16:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=XUGbPt6kej7ylnmx2SrxE7maB+HEW4YYHfA0Y874rtc=;
 b=MedCfatpSIRKbZeyZxU2eHrAFA3lTr97FgXOok/J5kc1LBO2EhTAsW+jva/TxaTF34
 jaN2LlXa0omyUoMJzxQqYW2nxkeDxCLXzSH3bBJcOyckkUip9A8JMRQ/KR27282vsy+R
 Dk7vJ0DbrrDHyeHZOzVlTKFYMMKyOtefjzMroTgVQeHQ1EqDD+waXjBa1VykPtQBETNt
 4wYqTVY//y+NlSYX05CubGhB/68s3/xlEsuHQsmAeE0Os/Np3AvMCS6NINal/V//NqBb
 xrsLnPnRg8nQi+pHnfUHgNftOvQaMdRVJ5wVmDwb/PMubGtnVstdgzpYPhITkLSmsD9Z
 5/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XUGbPt6kej7ylnmx2SrxE7maB+HEW4YYHfA0Y874rtc=;
 b=eVPY+fBhBQYBZGStj6YOmUCj2sbVFQ3TxaVXPYXYLyZz2K19Q1SJV+wRSo7IupHwuf
 XwjuNDzYQM9gtFqChCl86vZEvagLbTyasQRdCmOouWOe8lcLfXFMMVGvSH/XSSLS2dNa
 x0chWA1LmMPwYNjpP9G3uTyaEnAh4C3wthkw0ooRP4dHSP20qiC0RicJkK1fJ2CkIA16
 hGzuYCHJfedRbSZFPtUivDxyb1ERsFn0qruQupMRDstu+cX32mFa+ZT3wAOFxfTN5Tfv
 CWRalo8I3y5b/wfU8V43KVIw7uPt38pLF3yrrnwYWx523x2H8QOCaF9L1HaUM1k1J4oT
 56eg==
X-Gm-Message-State: APjAAAVo+Be321eqeLAUICwjrQtbogz6V1UnOh1UUctkbsaE9PaBjN4P
 6sUbp5/bMHETTKJ9WI82KcHcAPfwwww=
X-Google-Smtp-Source: APXvYqyjUFF66YAhw31e4KpsoCgqSQ6mKK3dmuAUFGIYN1V/FkbmXdi+PMR+uT70y1E5sBRr8NKwVA==
X-Received: by 2002:a05:620a:12b4:: with SMTP id
 x20mr441280qki.254.1571960162995; 
 Thu, 24 Oct 2019 16:36:02 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.180])
 by smtp.gmail.com with ESMTPSA id a19sm190640qtk.56.2019.10.24.16.36.02
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 24 Oct 2019 16:36:02 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iNmeA-0000SJ-1W; Thu, 24 Oct 2019 20:36:02 -0300
Date: Thu, 24 Oct 2019 20:36:02 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Message-ID: <20191024233602.GF23952@ziepe.ca>
References: <1558041162.3971.2.camel@linux.ibm.com>
 <fccc3abd-f3ce-fdb1-55d7-c18ce116446c@linux.vnet.ibm.com>
 <20190517150456.GA11796@dell5510> <20191024121848.GA5908@dell5510>
 <20191024172023.GA7948@linux.intel.com>
 <20191024182005.GZ23952@ziepe.ca>
 <20191024191402.GB12038@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191024191402.GB12038@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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

On Thu, Oct 24, 2019 at 10:14:02PM +0300, Jarkko Sakkinen wrote:
> On Thu, Oct 24, 2019 at 03:20:05PM -0300, Jason Gunthorpe wrote:
> > On Thu, Oct 24, 2019 at 08:20:23PM +0300, Jarkko Sakkinen wrote:
> > > Also replicants for durations and timeouts files would make sense for
> > > TPM 2.0.
> > 
> > These ones don't meet the sysfs standard of one value per file, which
> > is why they didn't make it to tpm2
> 
> They would be still useful to have available in some form as there is
> no way deduce them from the user space.

Why? Userspace doesn't refer to these values since the kernel handles
all the timeouts, right?

Jason

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
