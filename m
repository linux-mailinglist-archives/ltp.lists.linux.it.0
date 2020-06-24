Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EC6206F18
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jun 2020 10:41:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9A5293C58E9
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jun 2020 10:41:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 645853C0196
 for <ltp@lists.linux.it>; Wed, 24 Jun 2020 10:41:21 +0200 (CEST)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C048B6011B2
 for <ltp@lists.linux.it>; Wed, 24 Jun 2020 10:41:19 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YfP7DdtRBdgsOxCNtU27XTfOq061qksVlIHok/3cwDROyI4dEFslCpDSam6bv/eL3hZtaIlCWBVSMCQaTBPI9a5+fsvYUaQLIyxQhJMHl9c9In31GF5wQtrYC1budMaVF/Gd4+OnfLl2sa85CCyRtnwpDqAvG6/AmzN5LB9BFEWx7zjdJ1uUgEY/ZHZB9nGTIc5hZU+SUL0LGhU6qqHBSClNlgYJOu+0/3ruvfHGPNaMUZY0U63sQCEgSWBJbXAQa1lFZC0JAW6Xhbumo7Je5yma4t7um9GPgFFnJG+/ZiJ3uTJTjHJjkPvH49lPzOxvgLAwTiTw9NV/mstTYLad0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qC/5pyehFTas9IWC06BGcOzTv3bK6mVbHa4y+N4bs80=;
 b=eQHeA4NxZxk+IqqKymg6MwoLT4XuR4N5bgkdswdwWXNIzhEIIyMo2Pqf5U0GNlle988hFqPFbPWHLH8UDWp4wcme8gO7gxmyf+0tVkJ1QLfmfg9C1ajVSGTNcq2MI0DYbISCR/U7v+WEDnMlzgxCBkvjDCRBhiP7HusEkPcGyLs9Z/J1+jMnt7KPmdWZAc4rIySoxqTHD0QWKYzygd8E+Gl5zEx/b1H6mQ/+bE0AmAfu6ntaBgNFYU0KimfAkSWzdZ8w8mjtIq9YFhdGFEo/8kHLUCZ++onGUrlefbR2bm7PcUhkTEBjSG8mqMUMi4tgmGOXzcVjhczOuDI+ayQdsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=suse.cz smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qC/5pyehFTas9IWC06BGcOzTv3bK6mVbHa4y+N4bs80=;
 b=W+qeyxTM6R7s0O384riR+kE2m0SznS1m++VnsXwQglvvlpJdIfVd7rFAxq6uCyM0jQslsHtMbqaMR9c+X7xHwaaOWBQgsmAb6dqr8f8VfMdta4Le856wR+4lbS6mlG37IyFcgLf4JoTLNGZhMlYMtst7PI0e+/qiyxFlL5Qr4MY=
Received: from SN4PR0701CA0025.namprd07.prod.outlook.com
 (2603:10b6:803:2d::22) by SN6PR02MB5069.namprd02.prod.outlook.com
 (2603:10b6:805:67::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Wed, 24 Jun
 2020 08:41:16 +0000
Received: from SN1NAM02FT018.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:2d:cafe::57) by SN4PR0701CA0025.outlook.office365.com
 (2603:10b6:803:2d::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend
 Transport; Wed, 24 Jun 2020 08:41:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT018.mail.protection.outlook.com (10.152.72.122) with Microsoft SMTP
 Server id 15.20.3131.20 via Frontend Transport; Wed, 24 Jun 2020 08:41:15
 +0000
Received: from [149.199.38.66] (port=33376 helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <michal.simek@xilinx.com>)
 id 1jo0wr-00026n-H5; Wed, 24 Jun 2020 01:40:01 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp2.xlnx.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <michal.simek@xilinx.com>)
 id 1jo0y3-0004FB-0L; Wed, 24 Jun 2020 01:41:15 -0700
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 05O8fEBD014074; 
 Wed, 24 Jun 2020 01:41:14 -0700
Received: from [172.30.17.109] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <michals@xilinx.com>)
 id 1jo0y1-0004Em-9X; Wed, 24 Jun 2020 01:41:13 -0700
To: chrubis@suse.cz, ltp@lists.linux.it
References: <20200623112827.10744-1-chrubis@suse.cz>
 <20200623112827.10744-2-chrubis@suse.cz>
From: Michal Simek <michal.simek@xilinx.com>
Autocrypt: addr=michals@xilinx.com; keydata=
 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
 0Z1MQlmNcq2bhOMzTxuXX2NDzUZs4aqEyZQ=
Message-ID: <574e52f4-8988-a562-57c5-274a86e6e8cb@xilinx.com>
Date: Wed, 24 Jun 2020 10:41:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200623112827.10744-2-chrubis@suse.cz>
Content-Language: en-US
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFTY:;
 SFS:(376002)(39860400002)(136003)(396003)(346002)(46966005)(82740400003)(47076004)(5660300002)(31696002)(186003)(31686004)(81166007)(2906002)(82310400002)(356005)(426003)(316002)(8936002)(2616005)(9786002)(44832011)(478600001)(36756003)(70586007)(336012)(26005)(8676002)(4326008)(54906003)(70206006)(83380400001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04c0e065-7368-4e53-66ab-08d8181a5b66
X-MS-TrafficTypeDiagnostic: SN6PR02MB5069:
X-Microsoft-Antispam-PRVS: <SN6PR02MB5069EC5450CA7DAFF1EE2009C6950@SN6PR02MB5069.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0444EB1997
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dRwO8Vk/MoUiPYY2q/PIOq8sxkCGoVtN5Eem5wYH+pIywzrZ00Wd+D1IzAig02+DpOhj0Bv5qYRbi3QxOJkjgCoAyNfhoH/V/oLgb+TnRg47Oa14KBeBjwvmsBYodMila9M/Eg+4mnIl0HaU5LwyiywzS++eGjqVunG5GrpEQWQ7dK5nSH1pR8+ZscDtnD9jDICGCoUKXVJ/QC/Ll0LEcTpq23KsVz0qNazlhRd9nk/Ro/K4KnfAZlbewb9RojzmRw2rqv+oUi/Rzava4hnHPfkeeN5ZPJRw16V5Oqer7Upvyf0PnUU56g4+0NwoAB6bGRQcrtCyoZahocW2UGhWa10abzHWap02Ry0wNF9Q7wfKUr3Iax3TltIypQ5CHHtvjCrfMbHj5VmlW0LhUk0n32V92pfReJ6wr56z7D4LHn0=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2020 08:41:15.4489 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04c0e065-7368-4e53-66ab-08d8181a5b66
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5069
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
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
Cc: automated-testing@yoctoproject.org, Carlos Hernandez <ceh@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



On 23. 06. 20 13:28, Cyril Hrubis via lists.yoctoproject.org wrote:
> Device discovery
> ----------------
> 
> The problem
> -----------
> 
> Each lab has a different hardware capabilities and configuration. A test
> that heavily depends on a hardware needs to get this information in
> order to be able to run correctly.
> 
> The solution
> ------------
> 
> The test declares which devices it needs for a testing. In the uart test
> these are UART_RX and UART_TX which are two UART endpoints which are
> connected together.
> 
> This information is then passed as a parameter to a device-discovery.sh
> script that prints, possibly several lines, of device listrs, which is
> then parsed by the test library and the test is executed accordingly.
> 
> The data are passed to the test as a environment variables, if these are
> set prior to the test start, we do not even attempt to do a device
> discovery. If these are unset, we run the device discovery and loop the
> test around the lists we got.
> 
> Why this solution?
> ------------------
> 
> The device discovery is lab specific and does not belong to the test
> itself. This is an attempt to abstract the interface between the test
> and the hardware so that we can finally add device drivers tests into
> LTP.
> 
> Missing pieces
> --------------
> 
> There are stil a few missing pieces, but these are probably easy to fix

still

> as well.
> 
> Device reconfiguration
> ~~~~~~~~~~~~~~~~~~~~~~
> 
> I suppose that we may need to run a command so that the devices are
> reconfigured as we need them. I.e. the device-discovery.sh will have to
> output a comand that needs to be executed in order to prepare the

command

> physical environment e.g. relays in case of the UART.
> 
> Device parameters
> ~~~~~~~~~~~~~~~~~
> 
> We may as well need some extra info about the devices, e.g. is hardware
> flow connected in case of UART. So the device-discover.sh will add one

device-discovery.sh

> more environment variable e.g. UART_PARS="hwflow" that could be parsed
> in the test as well.
> 
> Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> ---
>  device-discovery.sh |   5 +
>  include/tst_test.h  |   3 +
>  lib/tst_devices.c   | 228 ++++++++++++++++++++++++++++++++++++++++++++
>  lib/tst_devices.h   |  32 +++++++
>  lib/tst_test.c      |  60 ++++++++++--
>  5 files changed, 321 insertions(+), 7 deletions(-)
>  create mode 100755 device-discovery.sh
>  create mode 100644 lib/tst_devices.c
>  create mode 100644 lib/tst_devices.h
> 
> diff --git a/device-discovery.sh b/device-discovery.sh
> new file mode 100755
> index 000000000..08460c41f
> --- /dev/null
> +++ b/device-discovery.sh
> @@ -0,0 +1,5 @@
> +#!/bin/sh
> +
> +if [ "$1" = "UART_RX-UART_TX" ]; then

I am not getting this condition and what exactly you want to tell by that.
> +	echo "UART_RX=/dev/ttyUSB0 UART_TX=/dev/ttyUSB0"

In fpga world you can connect two uart inside chip and test different
device drivers that's why at the end of day only user knows which uarts
are connected to each other and none will be able to come up with
universal device-deiscovery.sh script to cover all these cases.

Not exactly sure how LTP handles this in general but I think it makes
sense to extend your test (txt_test) parameters to pass TX/RX channel
via parameters directly to test.

Something like this
uart01_115200 uart01 -b 115200 -t /dev/ttyXX0 -r /dev/ttyXX1

IIRC RX and TX device could be the same which can mean that you want to
use internal or external loopbacks.

Thanks,
Michal

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
