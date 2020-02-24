Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D18169C96
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Feb 2020 04:18:58 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BEEA23C25F3
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Feb 2020 04:18:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 36BDC3C1CB8
 for <ltp@lists.linux.it>; Mon, 24 Feb 2020 04:18:53 +0100 (CET)
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 694A46006C4
 for <ltp@lists.linux.it>; Mon, 24 Feb 2020 04:18:52 +0100 (CET)
Received: by mail-pg1-x541.google.com with SMTP id j15so4383159pgm.6
 for <ltp@lists.linux.it>; Sun, 23 Feb 2020 19:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=KXnZjjfds0zu/9SRjCjuiJaSIqteQFKPDGVvegL+cZM=;
 b=y9E6k9wsrIvZZHBsIqr16AOLELXLRy/vekBuGibqTIaA0FQu11QS5hkTbw9Itu9AM8
 WURJb+SA21mDPVRBp14UD8eDYWIfog+fxBsP46wKp+4jrUXan4DkMFIMSqkQy8ZC3g/0
 WhunuHg3LVF1PaGQlL3O52pytM5tRNKdzRdpEfOIm6gFMTkdKC6WoRKl2kDsVzIOTeV6
 wdEa0bpOqpR6xypEUnWNAKVRdYzIuPgesaaEL/eF7EWlyPr2HT8jE59iy9M8kzQmNv1e
 l2L2VaRcrzK5Li0VLfzyRsgUwyLjm7JWMk9EgUc7Rsx4ygIhLswl9z937SH5bDK91zz6
 EhTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=KXnZjjfds0zu/9SRjCjuiJaSIqteQFKPDGVvegL+cZM=;
 b=N4NPsDiJRzhW0PpXMoVlbNiCy0aUEN0oqPX027AzTMRrSUnkYRHIKmLPrlEAnUnQ7J
 meSYCKyq80Yfv4uarvyYX74WmncPBSZkLPlsfjFF57jCP1+RUvJwNImHjXguQzRHKeyN
 IwdAZQz57FGZwV29N8OrzRuuxg6QZwKoDZVbuVJEvxeYqJNeteNb1l2ne7u2w4a/tzc5
 UKCS6OInKTDoQuQqwVuRr+mOItBSh5qGPcZ0ApwfeqwwKmv/kOtx1JbtQ1h2/cKmXP1p
 GsOx0Q4IxDaltuvsr+QDq9b4N+Kv+LsNmpoC4ewSaBaXEnFYR8mMaDS/0P6eKu97JO2c
 /k5g==
X-Gm-Message-State: APjAAAXn9WwAb1SOWfwaQZpeyNZ+Rc6KNPoGqMR6oxmZrnyoVzHeFq7j
 sChYZGqB7jfcPnLHWAzeu8sFUw==
X-Google-Smtp-Source: APXvYqyD67Dki0dMqBLTkt5mwPBYdaXeU6bs4KFcVipaucNyXwsTLR5D54VYPgWcvAuTo8FqyMirRA==
X-Received: by 2002:a62:5183:: with SMTP id
 f125mr47409704pfb.201.1582514330342; 
 Sun, 23 Feb 2020 19:18:50 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id z30sm10518021pff.131.2020.02.23.19.18.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 23 Feb 2020 19:18:49 -0800 (PST)
Date: Mon, 24 Feb 2020 08:48:47 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200224031847.4nbao5too3vuyfqx@vireshk-i7>
References: <cover.1582104018.git.viresh.kumar@linaro.org>
 <aab7ae7e324c40e8e995ff381384a402d2aba8f5.1582104018.git.viresh.kumar@linaro.org>
 <20200220170425.GB15699@gacrux.arch.suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200220170425.GB15699@gacrux.arch.suse.de>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 04/10] syscalls/fsopen: New tests
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
Cc: Vikas.Kumar2@arm.com, Vincent Guittot <vincent.guittot@linaro.org>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 20-02-20, 18:04, Petr Vorel wrote:
> However I have problem on fsopen01 and fsmount02.
> mkfs.vfat: Partitions or virtual mappings on device '/dev/loop0', not making
> filesystem (use -I to override)
> tst_mkfs.c:100: BROK: tst_test.c:830: mkfs.vfat failed with 1
> 
> .dev_fs_flags = TST_FS_SKIP_FUSE helps with exfat and ntfs, but this also fails
> on vfat.
> 
> This is tested on system with CONFIG_VFAT_FS=m and CONFIG_FAT_FS=m, vfat and fat
> are loaded by mkfs.vfat. IMHO we need something like TST_FS_SKIP_EXFAT | TST_FS_SKIP_FAT | TST_FS_SKIP_NTFS | TST_FS_SKIP_FUSE
> i.e. explicitly say what FS is not wanted no matter whether it's fuse or not.
> 
> Or maybe just TST_FS_SKIP_FAT | TST_FS_SKIP_FUSE would be enough.
> 
> NOTE: flags TST_FS_SKIP_EXFAT, TST_FS_SKIP_FAT, TST_FS_SKIP_NTFS do not exists yet.

I am not sure what should be done here.

@Cyril ?

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
