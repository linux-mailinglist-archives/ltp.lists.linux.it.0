Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3989427EE1C
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Sep 2020 18:01:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C7AEF3C2A93
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Sep 2020 18:01:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 61B3D3C2A0C
 for <ltp@lists.linux.it>; Wed, 30 Sep 2020 18:01:07 +0200 (CEST)
Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com
 [185.132.183.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 156D710006C5
 for <ltp@lists.linux.it>; Wed, 30 Sep 2020 18:01:05 +0200 (CEST)
Received: from pps.filterd (m0209326.ppops.net [127.0.0.1])
 by mx08-001d1705.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08UFxq3Y017713; Wed, 30 Sep 2020 16:01:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=S1;
 bh=XKugp65XUUkL9Ywh081hJiEwAa14RG7Dwlt8ue1KpfM=;
 b=YyscBC3sBg7LJQ+p7UOnQOypZcECqE8sZFTibkr/PbwrGu3DZXEBUfoKKTvn0m04HRzI
 8/Kh8cVAWXd5a+hHffC6y6s+spsgLcADnEAJvdsn+OWjJ3L69hhpPtryVXjXSnZ6adjH
 DRHBwmYO3nwdqAY4U4fipRyg+mla75Mpz4OJhRkIZTyHyTbuYiDHX81z3aaGB28j7MNY
 V8KW7ARC1RSQw7KjLdQ2U7j1jk+WQPdMYW74NlLDkFWY9mwQ4zgQHDxvjunhVc6KjI81
 3jK5ehEVW07UzO+QcrjktcCL4f3Wz+A9c+4BJtquEKJAKZXhErsTsdGEd1qBm1No1g1o 1Q== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
 by mx08-001d1705.pphosted.com with ESMTP id 33suufanp7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Sep 2020 16:01:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fJ41NRo40iWuMx3WlPlxS9eE29khSLsH9N2ZvOYcO7l3HpacL1zLR0qSCdWCCYcuw0Szp+gdV5TgJ6rHdwq4Mj0IjJfI33uiD5MUldJwa/u2AXPusdV8JubllcR/IYHozptXjWlHq+jdb7OXRF0DO/hU+5KBlPPQdD+wFW+6M+T4WZcHnLzqUBmmDVefsMPZMfzjbWMN6hGdHlz/0yZiYINdWd705M8fqRjuybtiApoorlTqvAlMcUj22LXGFzlQ+Pd6ZLPvq9kxx2xk8ecG+8ioyuHmpYxYzt8vmwyr6ADP0TMBMNvirUoZKYLeaUn74gcz2lleykFos/av8zYnvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XKugp65XUUkL9Ywh081hJiEwAa14RG7Dwlt8ue1KpfM=;
 b=LGCNYMk8PGDMOankyXlj4iDdFSv3xi6ioF8022a57D0nEGHEMSFE56yvBMqONaZ4/H5q3Bu0c9yON+Vql1eIAYyas8ZcR3yGGVQ2CvZ7NXmbRVc4tADxoC+YCzf04sRAoq5x9a8EOgWtUoCXJLWNNs+9y4qfUsJvCxEKHtHIItZIjXDFaYyfF1gwKG3OzPPBjNdGu53e8SRH0VAp9rPE1eCG/TODCNFQp1b5vGO4RnHClhZvB/mz2pZ+6GZQExHyLGbs/OmkkYiiuwNHXSS7TMzsGMaE6sA+TXDuuRNiTIaHm6PjPHVhivoYoCYLjSSzhKGsQ19j53aXY4I4F9ZpOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from CY4PR13MB1175.namprd13.prod.outlook.com (2603:10b6:903:40::23)
 by CY4PR13MB1382.namprd13.prod.outlook.com (2603:10b6:903:9f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.13; Wed, 30 Sep
 2020 16:01:00 +0000
Received: from CY4PR13MB1175.namprd13.prod.outlook.com
 ([fe80::882:fde6:250d:4bc3]) by CY4PR13MB1175.namprd13.prod.outlook.com
 ([fe80::882:fde6:250d:4bc3%12]) with mapi id 15.20.3433.030; Wed, 30 Sep 2020
 16:01:00 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Cyril Hrubis <chrubis@suse.cz>, Cixi Geng <gengcixi@gmail.com>
Thread-Topic: [LTP] [RFC] ltp test add reboot function
Thread-Index: AQHWfTwJrXyUoa07s0uKrksDE2kaNqlNpkbggDL5FE2AAMuWAIAAFn3Q
Date: Wed, 30 Sep 2020 16:01:00 +0000
Message-ID: <CY4PR13MB11757A2A70B0B80BACEA79E0FD330@CY4PR13MB1175.namprd13.prod.outlook.com>
References: <CAF12kFuE=4-T=eitwSb0F3fkGLLsmM3VEg4VNbioqJt2JiAEww@mail.gmail.com>
 <20200824074226.GB2466@yuki.lan>
 <CAF12kFvScxqxhY5wXTGL2RKnyM5vM0hEKDc+sHD-3Y=_C7FWcw@mail.gmail.com>
 <20200828130638.GD10501@yuki.lan>
 <CY4PR13MB11754F0072967B32B007D273FD520@CY4PR13MB1175.namprd13.prod.outlook.com>
 <CAF12kFspG2fQKUrA=HGWGQuHy=xJaL0gntqvksq+QmUK3mAdKw@mail.gmail.com>
 <20200903092448.GC6285@yuki.lan>
 <CAF12kFvbGhhwyAFnkv+3w2dwvVovTOeE5z+OnqiGz+rQ-5y6ZA@mail.gmail.com>
 <20200930140508.GA12097@yuki.lan>
In-Reply-To: <20200930140508.GA12097@yuki.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=sony.com;
x-originating-ip: [192.34.114.49]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 20d4f08a-0e57-4628-b458-08d8655a0690
x-ms-traffictypediagnostic: CY4PR13MB1382:
x-microsoft-antispam-prvs: <CY4PR13MB138277DE68858CC8BE9CBB53FD330@CY4PR13MB1382.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Fy4bKoQAdPm4YQg0sbG9KoCnPzf05S0MwKM2gsclTN52+8zz02xLraNxB7p04yOYwo6FYrw/GBCRpr91dGoziLWz2R5go6/Wjkg/qR1XP8OIwTeOH7Rc04noeg1VmV9f947PUzDCQJRgu0rYQ0RHpgjJNagw5gBpxQwArHXcsfNQBLLlyG+CAQnZOGM7pL9nwhWOcOeUqO9+3t/LceyQVDdHtr7rqLdYBQ39lfufaVpNjlK7gTAoxtvKFP6yUsqjKgVCz7LvV5R0YKtof/sIdTOqws+LiN+aFMB3cC96GE/D147JGDvLBJdVeuqYkPvwitemSWnp46atBbU/bBK4Pw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR13MB1175.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(376002)(396003)(39860400002)(55016002)(316002)(54906003)(9686003)(966005)(2906002)(52536014)(66446008)(76116006)(8676002)(33656002)(8936002)(64756008)(66946007)(66556008)(66476007)(83380400001)(478600001)(86362001)(186003)(5660300002)(26005)(110136005)(7696005)(4326008)(6506007)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: QYitoXsqNnMkEnRe6qpGNZ6kXR5IhztCezZUi7TKJVLTKaO/ytqg8E2TIv4QABUDwhxjnKUQtjyHAo2fNtBzsQsiq8PISF2XjtjfsOogxuatvP5KsmfpHnH+XW4lZxc5hHGk05tsjK8r4gDjWg/6huSFcs8+8QrsyvR4eWdyKhrewq2GSFK4EGE6Camnxe6UnHBwCf3lZhqD8yzPOirvNwhrzMT6XHtQnHR0y6d0FSqMKJrcIAvNxNqAD7j7g9X/1f2dav14YSy6qz8lrIGGsDJmDtGBD9ZPftWYO0D5dI1uULvl3liTdbSPRr9Yx2DvNgKmHG9I4LhBkxc2TOFCorGyCb1OBZ+cSlF8kcebNiHNqaZNKIH0HmrvD4CGKNFHIv2RDjA959qe6k/ceG4vnI7+AIl7jtUnxtl8+NEB+Swc4Z6/MGa/rPQg0JUEsHh60BNEzZhEAK1K7U4o33e3EYAFAsQWjTFdrDaWleonrzUg475nXVpddAijVm+q8+C6oytBxS/+A8/kgGwviH95JUCs2lOGYvMsUonaXeI5kaZ0hAkV8afk03tUwWNPFdFqhnLOaQqHKbRCT1RwTQQA/AdguzjKRCFQPeJthK35I+a3ISuWH+Si59gPS3cb9sc2Fx/OJCvXk1pF0FMFI60Sfg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR13MB1175.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20d4f08a-0e57-4628-b458-08d8655a0690
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2020 16:01:00.3104 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f/VFpeGFO5/9eQ0o1WWsXRIo2P6I7h2kG2MDIP8zNmghtmL6gSMnpocvIlFV51uJqRSYKYw2NQ4uEM+TcHGOrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR13MB1382
X-Sony-Outbound-GUID: WGnbWD9AoUICyx9HcUgxwzeGKmM_rYox
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-30_08:2020-09-30,
 2020-09-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 spamscore=0
 malwarescore=0 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009300127
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [RFC] ltp test add reboot function
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
Cc: Orson Zhai <orsonzhai@gmail.com>,
 "xingfeng.kang@unisoc.com" <xingfeng.kang@unisoc.com>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



> -----Original Message-----
> From: Cyril Hrubis <chrubis@suse.cz>
> 
> Hi!
> > I considered  running ltp with reboot function by HOST controller.
> > And here I found that if case need reboot before or after it run. the
> > HOST controller
> > is easy to implement, BUT when the case want reboot between it's verify_func
> > I hava no idea that how to continue run the rest verify_func
> > continuing after reboot.
> > Can you give some guidance?
> 
> I guess that we would have to add a command line parameter to the test
> library to tell the testcase to continue with the second half of the
> test. Then after the reboot the testcase would be executed with that
> option so that it knows that we are running it for a second time and
> then we have to pass that to the testcases.
> 
> And since the uClinux support is dead, we are free to reuse the -C flag
> for this purpose. Probably easiest solution would be to set a global
> variable (named tst_rebooted or something similar) if -C was passed to
> the test on a command line, then we can use the value of this variable
> in the test setup/verify/cleanup functions.

Just brainstorming here...

How about an environment variable that contains the location to resume
execution.  It could be a specific test case (within a test), or some value that the verify
function uses to skip down to the place to resume.

If set, the library would skip the setup operation (or modify it appropriately).

Something like this:

LTP_RESUME_POS=reboot_test:testcase_6

(or some better name :-) )

The value for the resume position would have to be sent to the test framework,
so it could set it (in the variable) on machine reboot.  The test framework has to know
to set something (either -C or LTP_RESUME_POS) so that the test can recognize it is
in a resume-after-reboot condition.

OR

Maybe it's sufficient for the test to create a temp file (in a temp directory that is known
to be persistent across a reboot, which not all of them are).  The presence of the temp
file could indicate a resume-after-reboot condition, and it's contents could be used
to indicate the resume position.

Question: does this "resume-after-reboot" condition need to be recognized by ltp-pan?

I'm still not sure what is envisioned for the interface between the test and the
test framework, to detect that it should resume a particular test on DUT reboot.
If the test is initiating the reboot, maybe it needs to communicate some data to 
the test framework (or whatever is performing the reboot), so that things can be
set up during boot to continue where the test left off.

We have been envisioning in Fuego supporting an API like the following, for 
a generic reboot mechanism for rebooting a board:

CLI:
lc board {board_name} reboot

REST API:
wget https://{lab-control-server}/api/devices/{board_name}/power/reboot

These are both intended to support immediate reboot of the board, and don't take
any parameters.  It seems like there's a bit of "knowledge" about the board
bringup that is outside the scope of just a simple board reboot operation, that would have
to be conveyed to the test framework and possibly the on-board boot initialization
code, to accomplish a resume operation for a test.  It's a bit hard to figure out
where the extra information should reside.  Should the data be placed in
the reboot API?  Should there be a separate call to the test framework/board control
software to prepare for a reboot-and-resume-test operation?

Just my 2 cents.
 -- Tim


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
