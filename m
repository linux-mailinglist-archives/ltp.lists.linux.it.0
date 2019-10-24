Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E96A3E48D8
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Oct 2019 12:49:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A7E653C22CB
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Oct 2019 12:49:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 8C2123C1860
 for <ltp@lists.linux.it>; Fri, 25 Oct 2019 01:26:50 +0200 (CEST)
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 9F57C200749
 for <ltp@lists.linux.it>; Fri, 25 Oct 2019 01:26:49 +0200 (CEST)
Received: by mail-qk1-x744.google.com with SMTP id y81so74407qkb.7
 for <ltp@lists.linux.it>; Thu, 24 Oct 2019 16:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=mbpTg5qmmsom9eXY09B3y2iC6+OCoeGXpKLIVw9dcm8=;
 b=PP7RHe29j2WqZmwfTqFwzjOSg4YdobHo+gLrNZJjbf3yCtass/AFmPUndCTtHHfOai
 bJoV4hwXZX0gxp1nNt4wexY2fw3m/TYWFjKRv7SxeoYZ+mVs8K432gspL2dDO8W5GbMe
 +u9Atd8iQJ4bYKHrN78cz2YkNRjCQ51TcqUuKP+nwPKYAiieyXitP2MtNKG15szEiNSR
 DgriH6MmkRA9Tsq3YvfBOrAk3nxVPUoeogQMZv8PJJ2CeZDP4yL1qs0LX4SNJGdkGtm4
 vcRmeQjbe90gJayLXbaYs6Eeky/FOhgRjoc3V3hZdp4rknGptb4GB518H7/LlDn3p5jp
 ULjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=mbpTg5qmmsom9eXY09B3y2iC6+OCoeGXpKLIVw9dcm8=;
 b=oAm0KSBBzLAEOuipPF5A9IOpNWjr3a4U02UMzWChKNe7a26lzkft03UlR6TCyIYICW
 cOg02Xj3bPFCnpNVfqxz3N5BTbotwC6QOzEnMIuoW4uq75S1BIhxNWGIQSn7sx8Lh7YB
 0p9ca04LHFv1EE0nDwTGpAxJlAAPfCwLu+SnqxEFIOzW7evCc8km5PDVdEvKCv9aFZ3p
 YJQ91MqstbvQ0jF6ouWH/1gu+su7Y0A9h7ys4VMJS7wII3+yBwGlk3oZfCGneHruXWUY
 6yK7CrJcBBEsBJxSlwfGrHxp6cIUFW+FZcCyHeHzNM3V/8wpDERmbLqkFFf8mXBG5H2Q
 OeyA==
X-Gm-Message-State: APjAAAVeob6mnM9HWcvPUevBjhyP0jDyszqI56gvltuMfajfmuKQVYlT
 PwXoeE83mrSxhMytfH1hzNtldQ==
X-Google-Smtp-Source: APXvYqyT8mQEf9DlEJ67gpw8LUZ5tvqg6Gj1nrjmJB5sksn58cIrXKW3AHVfMS3lxY378l1QjzJCMw==
X-Received: by 2002:a37:8d7:: with SMTP id 206mr397654qki.238.1571959608032;
 Thu, 24 Oct 2019 16:26:48 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.180])
 by smtp.gmail.com with ESMTPSA id j2sm142126qth.46.2019.10.24.16.26.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 24 Oct 2019 16:26:47 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iNmVC-0006zY-7A; Thu, 24 Oct 2019 20:26:46 -0300
Date: Thu, 24 Oct 2019 20:26:46 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerry Snitselaar <jsnitsel@redhat.com>
Message-ID: <20191024232646.GE23952@ziepe.ca>
References: <1558041162.3971.2.camel@linux.ibm.com>
 <fccc3abd-f3ce-fdb1-55d7-c18ce116446c@linux.vnet.ibm.com>
 <20190517150456.GA11796@dell5510> <20191024121848.GA5908@dell5510>
 <20191024172023.GA7948@linux.intel.com>
 <20191024213842.c6cl4tlnsi56pgcy@cantor>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191024213842.c6cl4tlnsi56pgcy@cantor>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
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
 Piotr =?utf-8?B?S3LDs2w=?= <piotr.krol@3mdeb.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 linux-integrity <linux-integrity@vger.kernel.org>,
 Peter Huewe <peterhuewe@gmx.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Oct 24, 2019 at 02:38:42PM -0700, Jerry Snitselaar wrote:
> On Thu Oct 24 19, Jarkko Sakkinen wrote:
> > On Thu, Oct 24, 2019 at 02:18:48PM +0200, Petr Vorel wrote:
> > > Hi all,
> > > 
> > > I wonder what to do with this patch "ima: skip verifying TPM 2.0 PCR values" [1].
> > > Is it a correct way to differentiate between TPM 1.2 and TPM 2.0?
> > > Or something else should be applied?
> > > 
> > > How is the work on TPM 2.0 Linux sysfs interface?
> > > But even it's done in near future, we'd still need some way for older kernels.
> > > 
> > > Kind regards,
> > > Petr
> > > 
> > > [1] https://patchwork.ozlabs.org/patch/1100733/
> > 
> > version_major sysfs file would be acceptable if someone wants to proceed
> > and send such patch.
> > 
> > Also replicants for durations and timeouts files would make sense for
> > TPM 2.0.
> > 
> > /Jarkko
> 
> Is it as simple as doing this?
> 
> diff --git a/drivers/char/tpm/tpm-sysfs.c b/drivers/char/tpm/tpm-sysfs.c
> index edfa89160010..fd8eb8d8945c 100644
> +++ b/drivers/char/tpm/tpm-sysfs.c
> @@ -309,7 +309,17 @@ static ssize_t timeouts_show(struct device *dev, struct device_attribute *attr,
> }
> static DEVICE_ATTR_RO(timeouts);
> 
> -static struct attribute *tpm_dev_attrs[] = {
> +static ssize_t version_major_show(struct device *dev,
> +                                 struct device_attribute *attr, char *buf)
> +{
> +       struct tpm_chip *chip = to_tpm_chip(dev);

> +       return sprintf(buf, "TPM%s\n", chip->flags & TPM_CHIP_FLAG_TPM2
> +                      ? "2.0" : "1.2");

Probably no TPM prefix here

The usual sysfs naming would be more like 'major_version'

Jason

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
