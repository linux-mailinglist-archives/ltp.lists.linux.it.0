Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F14E48D5
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Oct 2019 12:49:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 393623C22A6
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Oct 2019 12:49:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 8705C3C2345
 for <ltp@lists.linux.it>; Thu, 24 Oct 2019 23:38:53 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 5A9D16021C0
 for <ltp@lists.linux.it>; Thu, 24 Oct 2019 23:38:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571953130;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lQANpucKvOAjURgm9S+UVt5+2lKcM3WgQQHEXlGppkg=;
 b=UfySg7+di3qN0QsI0yXBqwGlNyi3masBaqAn17/AEUeea0ziYR9AOpRbM0X39DFM2wqzMv
 OM7EZbQ/438EVzVuSK+wfwvlylTvVvx43y153syYmrm1Le8thVVXiNw2uiEYraIwZVxZM9
 /c0CpcBYdicgkFNkr4GN4AVPocIOZeY=
Received: from mail-yw1-f70.google.com (mail-yw1-f70.google.com
 [209.85.161.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-6hFe66npNbm5vB5qqu89DQ-1; Thu, 24 Oct 2019 17:38:47 -0400
Received: by mail-yw1-f70.google.com with SMTP id o204so252219ywc.12
 for <ltp@lists.linux.it>; Thu, 24 Oct 2019 14:38:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=6bpScGowFHRBXcUEN+4yTWVU8KLyKeA/nY1wEZHF1W0=;
 b=fpJ7d35wZifZtoAT+aLlQEPj0PSu3v9546rrm5RJCOI+4E87LBUJGFegP6qzWN7+UZ
 CFNMHBvEVO4mNZNhvR5wy2iqFPjbQFWb1K4WfKbO2/LqDCNC8jmD9zruCp0jiipgleIO
 w76E/I7KGB/4OB3pidlB+VEW81s+sL+8dKSFkdf/1iwHvKyejPGGHEvL+GhbStQY3jG9
 F+/NvT7k+iT89EnCcpxLDHww8+dW8cNbC1N7lIatR77H4yYIkYYUh9WyN7tnCnNO33Hj
 NadJm8kfRpCajTH5cPWlp/5+4+IW+VWYEoFM9iD2lDPPeK3xrakmnhJev66zjP7QM3CC
 DATg==
X-Gm-Message-State: APjAAAVtcowKAjYljSl6fTqQhJ29bTH2fiEE1uuPB92QpnVIypyVNUFA
 alSvcYV31VFJU1mIlIgOJIN8LOGgBwJCWAJ6AQ5o1xIPA5l+w//IXUf1w5Llv8QujFg4P6J3z5f
 lrsjyjZA5cPM=
X-Received: by 2002:a5b:783:: with SMTP id b3mr392737ybq.441.1571953125663;
 Thu, 24 Oct 2019 14:38:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwP0jiaXh4Lq/w0sNsRcXQelkxPqeawRDU+N9vsZeqSkqSSzTlJSPjf6tf/5swn/HDSpYMqMg==
X-Received: by 2002:a5b:783:: with SMTP id b3mr392715ybq.441.1571953125249;
 Thu, 24 Oct 2019 14:38:45 -0700 (PDT)
Received: from localhost (ip70-163-223-149.ph.ph.cox.net. [70.163.223.149])
 by smtp.gmail.com with ESMTPSA id b73sm13172ywe.35.2019.10.24.14.38.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 14:38:44 -0700 (PDT)
Date: Thu, 24 Oct 2019 14:38:42 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Message-ID: <20191024213842.c6cl4tlnsi56pgcy@cantor>
References: <1558041162.3971.2.camel@linux.ibm.com>
 <fccc3abd-f3ce-fdb1-55d7-c18ce116446c@linux.vnet.ibm.com>
 <20190517150456.GA11796@dell5510> <20191024121848.GA5908@dell5510>
 <20191024172023.GA7948@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20191024172023.GA7948@linux.intel.com>
User-Agent: NeoMutt/20180716
X-MC-Unique: 6hFe66npNbm5vB5qqu89DQ-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
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
Reply-To: Jerry Snitselaar <jsnitsel@redhat.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Nayna <nayna@linux.vnet.ibm.com>,
 Mimi Zohar <zohar@linux.ibm.com>, ltp@lists.linux.it,
 linux-integrity <linux-integrity@vger.kernel.org>,
 Peter Huewe <peterhuewe@gmx.de>,
 Piotr =?utf-8?B?S3LDs2w=?= <piotr.krol@3mdeb.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu Oct 24 19, Jarkko Sakkinen wrote:
>On Thu, Oct 24, 2019 at 02:18:48PM +0200, Petr Vorel wrote:
>> Hi all,
>>
>> I wonder what to do with this patch "ima: skip verifying TPM 2.0 PCR values" [1].
>> Is it a correct way to differentiate between TPM 1.2 and TPM 2.0?
>> Or something else should be applied?
>>
>> How is the work on TPM 2.0 Linux sysfs interface?
>> But even it's done in near future, we'd still need some way for older kernels.
>>
>> Kind regards,
>> Petr
>>
>> [1] https://patchwork.ozlabs.org/patch/1100733/
>
>version_major sysfs file would be acceptable if someone wants to proceed
>and send such patch.
>
>Also replicants for durations and timeouts files would make sense for
>TPM 2.0.
>
>/Jarkko

Is it as simple as doing this?

diff --git a/drivers/char/tpm/tpm-sysfs.c b/drivers/char/tpm/tpm-sysfs.c
index edfa89160010..fd8eb8d8945c 100644
--- a/drivers/char/tpm/tpm-sysfs.c
+++ b/drivers/char/tpm/tpm-sysfs.c
@@ -309,7 +309,17 @@ static ssize_t timeouts_show(struct device *dev, struct device_attribute *attr,
 }
 static DEVICE_ATTR_RO(timeouts);
 
-static struct attribute *tpm_dev_attrs[] = {
+static ssize_t version_major_show(struct device *dev,
+                                 struct device_attribute *attr, char *buf)
+{
+       struct tpm_chip *chip = to_tpm_chip(dev);
+
+       return sprintf(buf, "TPM%s\n", chip->flags & TPM_CHIP_FLAG_TPM2
+                      ? "2.0" : "1.2");
+}
+static DEVICE_ATTR_RO(version_major);
+
+static struct attribute *tpm12_dev_attrs[] = {
        &dev_attr_pubek.attr,
        &dev_attr_pcrs.attr,
        &dev_attr_enabled.attr,
@@ -320,18 +330,28 @@ static struct attribute *tpm_dev_attrs[] = {
        &dev_attr_cancel.attr,
        &dev_attr_durations.attr,
        &dev_attr_timeouts.attr,
+       &dev_attr_version_major.attr,
        NULL,
 };
 
-static const struct attribute_group tpm_dev_group = {
-       .attrs = tpm_dev_attrs,
+static struct attribute *tpm20_dev_attrs[] = {
+       &dev_attr_version_major.attr,
+       NULL
+};
+
+static const struct attribute_group tpm12_dev_group = {
+       .attrs = tpm12_dev_attrs,
+};
+
+static const struct attribute_group tpm20_dev_group = {
+       .attrs = tpm20_dev_attrs,
 };
 
 void tpm_sysfs_add_device(struct tpm_chip *chip)
 {
-       if (chip->flags & TPM_CHIP_FLAG_TPM2)
-               return;
-
        WARN_ON(chip->groups_cnt != 0);
-       chip->groups[chip->groups_cnt++] = &tpm_dev_group;
+       if (chip->flags & TPM_CHIP_FLAG_TPM2)
+               chip->groups[chip->groups_cnt++] = &tpm20_dev_group;
+       else
+               chip->groups[chip->groups_cnt++] = &tpm12_dev_group;
 }


Did a quick test on 2 systems here.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
