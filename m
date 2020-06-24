Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E41206FE7
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jun 2020 11:21:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 771FB3C2BAD
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jun 2020 11:21:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 6608C3C0639
 for <ltp@lists.linux.it>; Wed, 24 Jun 2020 11:21:50 +0200 (CEST)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2045.outbound.protection.outlook.com [40.107.92.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7A75D600F16
 for <ltp@lists.linux.it>; Wed, 24 Jun 2020 11:20:56 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kViB+OzMwY4FgEejBdCRtQZB2RF+m+NSQiNKRO26Fa/ABfWZTqkYdgFn3dudAoFolvgKOCgE19DPJjqqn8fVCO523/M1RPeIlUMyBgEMr7N909T/F3JD78Dik6HEFW6RiIsc5p1jleZ1iTGltyVGY146Z5mQGkHCGtjO7WG4eVxNmzXu+l1XHyUcMJX7J7XO3bgCbv2Q5+ivN6aIBRR5SO3H02mQNK4z5PzG70alvfvY76oCO+QE4lkf6YrQjilwJOr10KQhxGzQcQLiqbXowZ6WdvkMOeTSRSxMHVJR/JKPUVeqBA+xaQkX4BO9ixKHueaUI7mQdUAQA7qwlkGjPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MJ4d53Hep0Aeha1IbuFzI0Ux6xjkjAwj/LmkStVJOwY=;
 b=irqZLihsFpYEUL29+S8QX449OdRlxC58CxqVhkCf4O5LGcJyTp8bcYJrF2N7b3c3o8nO3GOGOfnvO9BZl8L65IGtK777GS6s6j7WbrMqiVTepObG77Xik5v+H9h3AqclrwgUR62LPf/nKfc5PN9O1z99kBVT7kPXWC8s+885pR93HTIZMjJwdlO/vfLjpWICCLUo6tPHnDN53uMiQThaFIzYcbd+RJEu0SNlBisX0z1WJ0jqMo2q/ZeVNS+pWDDDxUFSWkhlJOsarq0Ek5gHrBC+pxnTES8AyUJXNUqE5InKmv0EpZm128aBGpg0eGyxpP3UDcvI9p4/iA4Swh/IyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=yoctoproject.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MJ4d53Hep0Aeha1IbuFzI0Ux6xjkjAwj/LmkStVJOwY=;
 b=mHc54lm0NzGXdn99uN++f2qkGHg5U4PuS/xH7VV5R64zF3RvTPIn2twz73EdmC8EIGY5g3FI4ceBtygxihIKAHm76/fNhwVja8mJqXSG4VRvfe8goz6HS+kFdHLKNl67iyzg/J8oW0MPojRpR5IbmdEx9XVtqlJHzVqrEO0IGNw=
Received: from CY4PR2201CA0006.namprd22.prod.outlook.com
 (2603:10b6:910:5f::16) by DM6PR02MB6171.namprd02.prod.outlook.com
 (2603:10b6:5:1d1::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Wed, 24 Jun
 2020 09:21:47 +0000
Received: from CY1NAM02FT035.eop-nam02.prod.protection.outlook.com
 (2603:10b6:910:5f:cafe::c7) by CY4PR2201CA0006.outlook.office365.com
 (2603:10b6:910:5f::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend
 Transport; Wed, 24 Jun 2020 09:21:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; yoctoproject.org; dkim=none (message not signed)
 header.d=none;yoctoproject.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT035.mail.protection.outlook.com (10.152.75.186) with Microsoft SMTP
 Server id 15.20.3131.20 via Frontend Transport; Wed, 24 Jun 2020 09:21:46
 +0000
Received: from [149.199.38.66] (port=58911 helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <michal.simek@xilinx.com>)
 id 1jo1a4-0004G8-WA; Wed, 24 Jun 2020 02:20:33 -0700
Received: from localhost ([127.0.0.1] helo=xsj-pvapsmtp01)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <michal.simek@xilinx.com>)
 id 1jo1bG-0002fe-HI; Wed, 24 Jun 2020 02:21:46 -0700
Received: from [172.30.17.109] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <michals@xilinx.com>)
 id 1jo1bF-0002fM-5Z; Wed, 24 Jun 2020 02:21:45 -0700
To: Cyril Hrubis <chrubis@suse.cz>
References: <20200623112827.10744-1-chrubis@suse.cz>
 <20200623112827.10744-2-chrubis@suse.cz>
 <574e52f4-8988-a562-57c5-274a86e6e8cb@xilinx.com>
 <20200624090523.GA29350@yuki.lan>
From: Michal Simek <michal.simek@xilinx.com>
Autocrypt: addr=michals@xilinx.com; keydata=
 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
 0Z1MQlmNcq2bhOMzTxuXX2NDzUZs4aqEyZQ=
Message-ID: <adafab63-4390-a4a3-b3aa-923b31d5ac37@xilinx.com>
Date: Wed, 24 Jun 2020 11:21:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200624090523.GA29350@yuki.lan>
Content-Language: en-US
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFTY:;
 SFS:(39860400002)(136003)(376002)(346002)(396003)(46966005)(356005)(70206006)(70586007)(83380400001)(81166007)(5660300002)(31696002)(47076004)(2616005)(31686004)(82740400003)(426003)(44832011)(54906003)(4326008)(26005)(8676002)(186003)(82310400002)(336012)(9786002)(36756003)(316002)(6916009)(478600001)(2906002)(8936002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 177075f9-a343-4c9f-0050-08d8182004af
X-MS-TrafficTypeDiagnostic: DM6PR02MB6171:
X-Microsoft-Antispam-PRVS: <DM6PR02MB6171FB0C8DADE839F1D81FBFC6950@DM6PR02MB6171.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0444EB1997
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mP9gQN3IiTtRZaVK1WauiBs6g7orMYZf2i84n/e/SXmpH4yaEkYZllng/PxPjKp9j/XJQutefsx4yA4n3ORxEgeVK3nY7kWdsY4ZGB4WDLwG7wHYwBzzaG+FgG+mRX6eJlwG0W871wCD0/QXzg32+pgRBS/EMf/eijHbH1zPE3mcBwIprjDOCdz01Ki/FkyzVXmUZPySOULK3rgmp7RS3r5hWAhZ2b2O61pZLnYigzHWj9iYe0LGpWoNDo3saQncth6yOd+KPDon0xBDzo43Nx6QrUcJT5J+BlXvBZ8fFkPRuaiFMTUxTmz+j4TVxxpQph4VnJShu19Wcqd5Ym2cAqGs0U0JdhhcBKlBtoL41h1yKcYZOohuhMtUJpJZ/z0rlHH/UWQSIlC8zNhW9nlm6fZR8y0ZnggZpyNCLWb0MxE=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2020 09:21:46.9433 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 177075f9-a343-4c9f-0050-08d8182004af
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6171
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [Automated-testing] [PATCH 1/2] tst_test: Add support for
 device discovery
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
Cc: automated-testing@yoctoproject.org, Carlos Hernandez <ceh@ti.com>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



On 24. 06. 20 11:05, Cyril Hrubis wrote:
> Hi!
>>> +++ b/device-discovery.sh
>>> @@ -0,0 +1,5 @@
>>> +#!/bin/sh
>>> +
>>> +if [ "$1" = "UART_RX-UART_TX" ]; then
>>
>> I am not getting this condition and what exactly you want to tell by that.
>>> +	echo "UART_RX=/dev/ttyUSB0 UART_TX=/dev/ttyUSB0"
>>
>> In fpga world you can connect two uart inside chip and test different
>> device drivers that's why at the end of day only user knows which uarts
>> are connected to each other and none will be able to come up with
>> universal device-deiscovery.sh script to cover all these cases.
> 
> That's the whole point of the patchset.
> 
> This is a script I've used for testing with a hardware loopback on the
> USB-to-serial bridge, it's not supposed to be included in the end
> result. I've kept it there so that people will get the idea how it
> should look like.
> 
> Also script is passed which devices the test requests, so for i2c eeprom
> the parameters would be different and the script would output, for each
> present eeprom, a line with an address, bus, etc.
> 
> The whole point of the script is to do plug into a Lab CI so that the
> information about test device, in this case UART loops, is exposed to
> the test. In a real world situation it would either do a call to a
> whatever is maintaining a lab hardware inventory, or be written down by
> a user before these tests are executed.

I understand that you want to run a script which can be wired with Lab CI.

> 
>> Not exactly sure how LTP handles this in general but I think it makes
>> sense to extend your test (txt_test) parameters to pass TX/RX channel
>> via parameters directly to test.
>>
>> Something like this
>> uart01_115200 uart01 -b 115200 -t /dev/ttyXX0 -r /dev/ttyXX1
> 
> You can pass them in an environment variables. If UART_TX and UART_RX
> are set the device discovery is not attempted at all and the test just
> uses these.
> 
> If they are not the script is executed and the test loops over the
> result(s). It would be more complicated if the devices were passed over
> command line parameters since we would have to re-execute the binary.

I didn't run LTP for quite a long time myself but on xilinx devices you
have 3 different uart instances which you can wire: cadence uart (or
pl011), ns16550 and uartlite.
That means with the same hw design you should be able to to test
cadence<=>ns16550 and ns16550<=>uartlite. It means you need to exchange
variables in the middle of testing.

Not sure if this is supported but I would simply generate runtest
description based on information I got from device discovery.
But I am far from testing at this stage.


> 
>> IIRC RX and TX device could be the same which can mean that you want to
>> use internal or external loopbacks.
> 
> The test works fine with external loopback. We will have to add a way
> how to pass "enable loopback in MCR" to the test if we want to use that,
> but that falls under the "Missing pieces" in the patch description.

I am happy with todo. :-)

Cheers,
Michal


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
