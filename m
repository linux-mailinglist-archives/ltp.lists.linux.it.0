Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F90E48DB
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Oct 2019 12:49:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 14B743C22AF
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Oct 2019 12:49:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 8993B3C181B
 for <ltp@lists.linux.it>; Fri, 25 Oct 2019 04:12:09 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 22B2314019AF
 for <ltp@lists.linux.it>; Fri, 25 Oct 2019 04:12:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571969526;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jidlgzTgtjWEnSlNkbgFbTTY71x/qeOQ/z5fqs+Lrko=;
 b=IkWcIqu7d0121mRk6ACYV9nOR2isdRHSdOAgaQhEg9IlV5ccoIkS9sW/xbL6nL8PQ3ubJL
 2DaOErTOBUdXiatuhTQMrHRrCsiZRfjoEEC5lZsG3P+Kez9jXzmwdQR6aXsU5gavQvfzeU
 dINT8t+0hrCM7rwTcOvu2dvzyky7HRM=
Received: from mail-yw1-f72.google.com (mail-yw1-f72.google.com
 [209.85.161.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-RonvD57gN7CFcJoIIwqtGg-1; Thu, 24 Oct 2019 22:12:04 -0400
Received: by mail-yw1-f72.google.com with SMTP id q127so50666ywg.22
 for <ltp@lists.linux.it>; Thu, 24 Oct 2019 19:12:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=SaVdG3lhFlR6Qr8n+mB9mHj2cm/I2mQXo1eS2C+ohX4=;
 b=aMOGZqUN09m68CzGz2ffePOk1o2fjesOIzBxhmhRPIrQm6tpxIq0S+IvraPDznCLLr
 zK5SqnOemM42GyAyt8QdW28CsDj+krU+elHMTCzNcJt1cl82t9UUjsYLcbQYHLCB9RKI
 Jimb7zfEp5muXZMbSWU9UjS1uSU8lEa3o/H/kt0XSI7zmExE9l9tqVeD1FkO6Fq3FhaZ
 8weHaVApP1IfkznX9DEEvoSLLX/JPN/9pOJ6qjVJUZBrnpxdz79Vz7yxqtzvQ0IOpvIr
 KDS9GQX4VY754PT9japYem2wG9NEovuRfbytUd0mR3mCFnxNhBFkDV1zY+Q5QklsuJUL
 BvrA==
X-Gm-Message-State: APjAAAWdrkfS6cO0rPhsPrk6uuqGKNJ9cFmAvgolNwxB2ZQAuI5QNRnT
 7jYXpGAgiK/SBRXXm6Ny0WmAPC/2+qTfa6MEA+m4WiUDg8OKIlMoPrq2cr1hNahbRt1sP7Vl8M3
 DqUmXRp9+TP0=
X-Received: by 2002:a81:48d1:: with SMTP id v200mr453777ywa.318.1571969522586; 
 Thu, 24 Oct 2019 19:12:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyG+6dQfDIBqeRdQtBluev4gHldBXK3OS55p+h88o8nlmDitJfjQinSbtm8/Wvr3vNnEumnBQ==
X-Received: by 2002:a81:48d1:: with SMTP id v200mr453756ywa.318.1571969522151; 
 Thu, 24 Oct 2019 19:12:02 -0700 (PDT)
Received: from localhost (ip70-163-223-149.ph.ph.cox.net. [70.163.223.149])
 by smtp.gmail.com with ESMTPSA id j3sm543643ywb.10.2019.10.24.19.12.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 19:12:01 -0700 (PDT)
Date: Thu, 24 Oct 2019 19:11:59 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Mimi Zohar <zohar@linux.ibm.com>
Message-ID: <20191025021159.dt7ifgnebnke6ca7@cantor>
References: <1558041162.3971.2.camel@linux.ibm.com>
 <fccc3abd-f3ce-fdb1-55d7-c18ce116446c@linux.vnet.ibm.com>
 <20190517150456.GA11796@dell5510> <20191024121848.GA5908@dell5510>
 <20191024172023.GA7948@linux.intel.com>
 <20191024213842.c6cl4tlnsi56pgcy@cantor>
 <1571964420.5173.12.camel@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <1571964420.5173.12.camel@linux.ibm.com>
User-Agent: NeoMutt/20180716
X-MC-Unique: RonvD57gN7CFcJoIIwqtGg-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
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
Reply-To: Jerry Snitselaar <jsnitsel@redhat.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Nayna <nayna@linux.vnet.ibm.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, ltp@lists.linux.it,
 linux-integrity <linux-integrity@vger.kernel.org>,
 Peter Huewe <peterhuewe@gmx.de>,
 Piotr =?utf-8?B?S3LDs2w=?= <piotr.krol@3mdeb.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu Oct 24 19, Mimi Zohar wrote:
>On Thu, 2019-10-24 at 14:38 -0700, Jerry Snitselaar wrote:
>> On Thu Oct 24 19, Jarkko Sakkinen wrote:
>> >On Thu, Oct 24, 2019 at 02:18:48PM +0200, Petr Vorel wrote:
>> >> Hi all,
>> >>
>> >> I wonder what to do with this patch "ima: skip verifying TPM 2.0 PCR values" [1].
>> >> Is it a correct way to differentiate between TPM 1.2 and TPM 2.0?
>> >> Or something else should be applied?
>> >>
>> >> How is the work on TPM 2.0 Linux sysfs interface?
>> >> But even it's done in near future, we'd still need some way for older kernels.
>> >>
>> >> Kind regards,
>> >> Petr
>> >>
>> >> [1] https://patchwork.ozlabs.org/patch/1100733/
>> >
>> >version_major sysfs file would be acceptable if someone wants to proceed
>> >and send such patch.
>> >
>> >Also replicants for durations and timeouts files would make sense for
>> >TPM 2.0.
>> >
>> >/Jarkko
>>
>> Is it as simple as doing this?
>>
>> diff --git a/drivers/char/tpm/tpm-sysfs.c b/drivers/char/tpm/tpm-sysfs.c
>> index edfa89160010..fd8eb8d8945c 100644
>> --- a/drivers/char/tpm/tpm-sysfs.c
>> +++ b/drivers/char/tpm/tpm-sysfs.c
>> @@ -309,7 +309,17 @@ static ssize_t timeouts_show(struct device *dev, struct device_attribute *attr,
>>  }
>>  static DEVICE_ATTR_RO(timeouts);
>>
>> -static struct attribute *tpm_dev_attrs[] = {
>> +static ssize_t version_major_show(struct device *dev,
>> +                                 struct device_attribute *attr, char *buf)
>> +{
>> +       struct tpm_chip *chip = to_tpm_chip(dev);
>> +
>> +       return sprintf(buf, "TPM%s\n", chip->flags & TPM_CHIP_FLAG_TPM2
>> +                      ? "2.0" : "1.2");
>> +}
>> +static DEVICE_ATTR_RO(version_major);
>> +
>> +static struct attribute *tpm12_dev_attrs[] = {
>>         &dev_attr_pubek.attr,
>>         &dev_attr_pcrs.attr,
>>         &dev_attr_enabled.attr,
>> @@ -320,18 +330,28 @@ static struct attribute *tpm_dev_attrs[] = {
>>         &dev_attr_cancel.attr,
>>         &dev_attr_durations.attr,
>>         &dev_attr_timeouts.attr,
>> +       &dev_attr_version_major.attr,
>>         NULL,
>>  };
>>
>
>The TPM version seems to be included in "dev_attr_caps.attr".
>
>> -static const struct attribute_group tpm_dev_group = {
>> -       .attrs = tpm_dev_attrs,
>> +static struct attribute *tpm20_dev_attrs[] = {
>> +       &dev_attr_version_major.attr,
>> +       NULL
>> +};
>
>This should work, but wouldn't exporting this information under
>security/tpmX, like the binary_bios_measurements, be a lot easier to
>find and use?
>
>Mimi
>

/sys/kernel/security/tpmX/major_version (on fedora and rhel at least, is it elsewhere on other distros?)

versus

/sys/class/tpm/tpmX/major_version

I don't know that it is any easier to find.

>> +
>> +static const struct attribute_group tpm12_dev_group = {
>> +       .attrs = tpm12_dev_attrs,
>> +};
>> +
>> +static const struct attribute_group tpm20_dev_group = {
>> +       .attrs = tpm20_dev_attrs,
>>  };
>>
>>  void tpm_sysfs_add_device(struct tpm_chip *chip)
>>  {
>> -       if (chip->flags & TPM_CHIP_FLAG_TPM2)
>> -               return;
>> -
>>         WARN_ON(chip->groups_cnt != 0);
>> -       chip->groups[chip->groups_cnt++] = &tpm_dev_group;
>> +       if (chip->flags & TPM_CHIP_FLAG_TPM2)
>> +               chip->groups[chip->groups_cnt++] = &tpm20_dev_group;
>> +       else
>> +               chip->groups[chip->groups_cnt++] = &tpm12_dev_group;
>>  }
>>
>>
>> Did a quick test on 2 systems here.
>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
