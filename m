Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EB634E8C2
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Mar 2021 15:17:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1B62F3C278A
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Mar 2021 15:17:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3FF153C0CB5
 for <ltp@lists.linux.it>; Tue, 30 Mar 2021 15:17:48 +0200 (CEST)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A68C81400437
 for <ltp@lists.linux.it>; Tue, 30 Mar 2021 15:17:47 +0200 (CEST)
Received: from DGGEML403-HUB.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4F8qh12MNDzRKdc
 for <ltp@lists.linux.it>; Tue, 30 Mar 2021 21:15:45 +0800 (CST)
Received: from DGGEML531-MBX.china.huawei.com ([169.254.6.126]) by
 DGGEML403-HUB.china.huawei.com ([fe80::74d9:c659:fbec:21fa%31]) with mapi id
 14.03.0513.000; Tue, 30 Mar 2021 21:17:34 +0800
From: zhaogongyi <zhaogongyi@huawei.com>
To: Petr Vorel <pvorel@suse.cz>, xieziyao <xieziyao@huawei.com>
Thread-Topic: [LTP] [PATCH] syscalls/chdir01: Add umask before mkdir
Thread-Index: AdclZwKsZLEMwzJFSbylvo4oT7uokw==
Date: Tue, 30 Mar 2021 13:17:33 +0000
Message-ID: <F3D3F6AC3820BB4C9FCA340DB5C32CB40389E8F1@dggeml531-mbx.china.huawei.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.67.110.209]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/chdir01: Add umask before mkdir
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr,

Umask is always 022 in many system env. In this testcase, if umask is not 022, for example, umask is 0077, test would fail because the file mode is affected by umask.

Thanks!

Best Regards,
Gongyi

> 
> > When uid is nobody, umask is not 022, the test process might
> Not sure if I understand "When uid is nobody, umask is not 022", umask
> setup depends usually on the system. I wonder which system has different
> setup for nobody.
> 
> BTW later was posted another solution, see my comments there.
> 
> Kind regards,
> Petr
> 
> [2]
> https://patchwork.ozlabs.org/project/ltp/patch/20210322091512.103266
> -1-xieziyao@huawei.com/
> 
> > has not permmission to access the file which created by SAFE_MKDIR
> > with mode 0755.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
