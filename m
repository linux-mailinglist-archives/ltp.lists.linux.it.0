Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E69B4365E6A
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Apr 2021 19:21:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B88483C92A8
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Apr 2021 19:21:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A09CF3C1D6B
 for <ltp@lists.linux.it>; Tue, 20 Apr 2021 19:21:46 +0200 (CEST)
Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com
 [185.132.183.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id B737A1400DEB
 for <ltp@lists.linux.it>; Tue, 20 Apr 2021 19:21:42 +0200 (CEST)
Received: from pps.filterd (m0209329.ppops.net [127.0.0.1])
 by mx08-001d1705.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13KHHMRR004859; Tue, 20 Apr 2021 17:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=S1;
 bh=wdvNgkVcgDjBsM6lqIIuuzGQ4atmT6PEDmqt1D5aNLg=;
 b=DvNB/tffVRsGjALFNInYy/mebwBYFhDwVY+JXwwglfqSHemaz0K0gERZE+78o1Ptb3Iz
 szsjpQzm+MMNvxGsD0fuiyWg/C0n7PxmdTHtTMhDpy/3w9S2TUQ1xxocmDpWvhw+iGun
 o/YXWAr12MonWicX1fgFtGy3Sn2VugFvi7Fs+A5GbQIQO+ARAZuXflmy/qqLMm5MKUm0
 THb6IFek4Bq7poJoiyKfIkZ8504ruQiKFM1UXu16Id+8DQyWZFgeheDNb6m6qr+8GlVf
 aR4gcn9o1AI/TuQNoCuovGlA2ro8zQFuuvc1bKzGsVhfalIAoGikbebCfScgo0I4IMdB dQ== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
 by mx08-001d1705.pphosted.com with ESMTP id 37ypb027rq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Apr 2021 17:21:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W8v/3q+tX3ZvAJ7iK+QQx1wCJF3AffV3zeA52p2zrvGo3Umhs3jjLFLgToGcOl26qm3J6FXyY9yVza/WOdrCgGQKSa4/UKdesAZm0P0IgnuUwwzGBWvEb+p3uqIq5RkYthOKWhZFOdihKxXfZB+VChSMZnV9oF6xYsK/wxFm4cnB+5SSlwon4YPWp+OUJx/sk9eoRMibpgzSSX/70e+8CJfKNhPz94C6vQsxKqwlzrzW3vuTzIDwm8pwO/41U0H4lGKZ7CWoBQpB4FJH+miTYf1BAxFECunQGWcFSHB+Mx51VvSz6TdbXGm5ZanMPYnjN5yx8AYNLMNXKxV4D1tmhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wdvNgkVcgDjBsM6lqIIuuzGQ4atmT6PEDmqt1D5aNLg=;
 b=oUNVMzuZKqXWAat5P0z5w/93E+pPg4819t6cmhk+N1bJe1KQL0sVaEyoFjOzNouWi4syeawN4tzgxQPMsNHWX7BRXcnmac3z1S0tVw4c/IB6kwAzF7+1tJhK4fEPIpDe9rja3CeXqNCEL2UIi5bO7y305VaBOMtdVf7P8J/Oor+13EqUnfBVWdpy/nfJUAABkXTltPteeBVRXHCXo9AYyOPZ3P9yD/V/CV9GzaI+URdHQgjs0UW5GAAMYp+8c13dTMivGuQluG0Cb/6aTfwcAKygnZzI3co3TEddspuX20aSeUOe4r1WmzEKxjXPl0YLFzqP0wsZFFW31o68FVnWlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from BN7PR13MB2499.namprd13.prod.outlook.com (2603:10b6:406:ac::18)
 by BN6PR13MB3220.namprd13.prod.outlook.com (2603:10b6:405:7d::34)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.8; Tue, 20 Apr
 2021 17:21:38 +0000
Received: from BN7PR13MB2499.namprd13.prod.outlook.com
 ([fe80::24ab:22c1:7c5f:2ca6]) by BN7PR13MB2499.namprd13.prod.outlook.com
 ([fe80::24ab:22c1:7c5f:2ca6%7]) with mapi id 15.20.3999.016; Tue, 20 Apr 2021
 17:21:38 +0000
From: <Tim.Bird@sony.com>
To: <chrubis@suse.cz>, <ltp@lists.linux.it>
Thread-Topic: [LTP] runltp-ng and possible ltp-pan deprecation
Thread-Index: AQHXNezOrmXMl0GkPEGQOC9AX1QIn6q9pXmw
Date: Tue, 20 Apr 2021 17:21:38 +0000
Message-ID: <BN7PR13MB249975B793E09DE0D217775DFD489@BN7PR13MB2499.namprd13.prod.outlook.com>
References: <YH7Z8nOX90qjsMpa@yuki>
In-Reply-To: <YH7Z8nOX90qjsMpa@yuki>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=sony.com;
x-originating-ip: [136.175.96.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f1bd5205-dc95-407b-1210-08d90420c1b1
x-ms-traffictypediagnostic: BN6PR13MB3220:
x-microsoft-antispam-prvs: <BN6PR13MB3220FFA143C13BAABD388B92FD489@BN6PR13MB3220.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kaLLDjErLIcOejNoJweAhMtYnzQ1ctpSOJdTw10gGf3cB4sXl+wK3uxF//W8k305lL8wWbw3k/IIs1CVI0B+t++XoB8oczv2TVhyPIKevLdOCPM2/iJeVoFK6G1Yg4afjNYecN+6Da1TEcFWg5Zu6dHA+gA1W9ySbb86ietA2GRGb7IwxUX9VEe503jOoWqKph1skDBpfC7AKPG7uePLDIXZS0mXKRRcnZLQIKGg59zGPyoeyYsRa6/qGMMK9m6SaSyQaAtp48/+2U5EoZS+a2IN8KTsZXkoUzKPat3Dk4EAvOp6Mdchhl0VOZyMzYzyhqAvc1sBZzITC0SX8ytFWG85uJC2PsshCAMoAyvg0nEgwpd5FOiDhbtPz4qKPgxyCI0J+wWmI6lo5WW2wZ0T1/GFa2xrr1SaoZzDhBox/si2senQCsG9RlLrjjPM0Zp9T3t402TaNoak9W1W8fLjsUvaWFxHFMY6K6nmwiA1+X6QlEbtUcLu7QkdRnSLCCBpjWqg+dt3wDznxcGfnDegymST4qO8eJXDGKzqyA0pyJ3Aln8BSOcBfrBi+8QqiqUDeYxwbu2Q09YSVvVckhcTFPdKe7dEnGIuiAiBWuaK1RruqXez1ys93lZGlQqxyoDyyBnd8yvQLp68c55gRoq/FiKx9FLKG83w44E4wTGz6nAlORmOGw7VsJUGhKeLtEuT
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR13MB2499.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(39860400002)(396003)(366004)(66556008)(8676002)(76116006)(66946007)(86362001)(66476007)(66446008)(186003)(38100700002)(33656002)(64756008)(71200400001)(26005)(122000001)(5660300002)(6506007)(52536014)(2906002)(7696005)(83380400001)(966005)(478600001)(55016002)(9686003)(316002)(8936002)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?YaAaY/zUYJIjrhuO8AAUms5DXDqFh0Xyve+vStahQ8oP6zEiceBgXP9DOTm4?=
 =?us-ascii?Q?RYH0h0MF2IWfk+nQDTRScYtRoMPkkV8y2pbRW8BexJo8XQ+uD4uh6MuesXUb?=
 =?us-ascii?Q?y1PfsgJd0zOwsruzH+1mHVVSDdfkaMq7H6XpHBatkekBPGKRmw6cq+BTbuB6?=
 =?us-ascii?Q?Py4Q+aJPRdzxPM68uZgzsE0OTKXCdxV9x3q/VhPjTEpCP0ipeeuw2YOyYbZa?=
 =?us-ascii?Q?bzPN3OqXcuqKlnbV06Y4KkR45cTGN6CphwNUUk2kNC8GxOPy9I9TFNO7vj3B?=
 =?us-ascii?Q?ChKk7cBxzWegU3h58pmhBCwtSxoK1+qB92z94cXNVFT0nmV7y+H9DCOSFwYV?=
 =?us-ascii?Q?dMkAb0Z1I46YgKPOCBGmCWTfVrjJqN1KFHTIUXpiDOg+f5ru+gJ7pmNydI12?=
 =?us-ascii?Q?s/tyaFwRvo7rMW/WAebU1PBWRnM+knxO9aOT/41WDjTWGQWJqJEmA4xsjxvE?=
 =?us-ascii?Q?Se5xzstVvUUMBV38qGrFUydv89xxfp+4k2W+G22OQ0LFKElGgyIZ/b3vNQwh?=
 =?us-ascii?Q?2oFr3Mu4lLVPBhdWESOZt+tvG0xYyaN2WCVSwkKe3yv6XlWwkKJjR+/zYvos?=
 =?us-ascii?Q?VptdhWj08K2PsE1ZJneUYCFKP/WXfVhRJXp+2O6KQyQWQOqUP976cDs/W8bE?=
 =?us-ascii?Q?wVkMncpSA9bN6D6l2n7hNmg/HAdot90VaKiT6NhUhrPateqNslVK9R0R7CYO?=
 =?us-ascii?Q?t6LoXECHPB5EvlVjRZ7enOTmr0vLtgWcljsT/P0lKxwO8VRgATQAnDNyYlO/?=
 =?us-ascii?Q?e851f9PPrJk3lF/KChIeSF35H0jTVTQiaZS6slK/dzslBWDhS+fPrv2MAPV3?=
 =?us-ascii?Q?3+G3DNaEQNDt+h0mvHmMtyyibKx0vwr2NArP509jcBmW42kNn5zjPklTJ1Ug?=
 =?us-ascii?Q?F/K5oGYKOAk1liWvje6+LPiogbTHcbiUrOIUT6QkukcWvhfHAK40LulPigm9?=
 =?us-ascii?Q?eJSNg4IaLDQK3fjo4oPAxF5EMT64yOLjbKUJ/m8xmAP6xTECHKLbK5G7gxPT?=
 =?us-ascii?Q?mFz/icyysf13YT0AWBLDcYn02XRmNg9i/6s7pow4Jj4Yz5weXQss0udRjZIY?=
 =?us-ascii?Q?4T5sVc3H7O5Y4YAlVcj4cdCrtdZMHhai91mmVedoMpPy1t58UN6d/pKsw3JO?=
 =?us-ascii?Q?Y7pLrGYUp5QLcR0EKsL1YpZkeRH5EZqhOQ4g9/jDI1fa+GHP06sintVpn6lB?=
 =?us-ascii?Q?skWyQK0GKkh7tHOUQ4fwRC0ktzoBEt6bUqkAVzlnflGMsr3o0YGO4AXJUIXA?=
 =?us-ascii?Q?t8annhikDtf5UzFz3/TjRGuOGxG9FtScRoRfXb6jJ7S7IEVtowUQhUX2xlza?=
 =?us-ascii?Q?TNvcdfIrjfjPrgXBooXLNkVq?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR13MB2499.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1bd5205-dc95-407b-1210-08d90420c1b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2021 17:21:38.3858 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ibv3suDJzzkvY6u6Bj3CYUCqi6qtCEOQZh2ywap4rZY/2b1ufYFEuFFlLg7YF+xzwbJzXyHpqOBlDCTtFkfz8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR13MB3220
X-Proofpoint-GUID: 2zu8o9N1g5apw4Rbr_tdKvlnenglA_Dn
X-Proofpoint-ORIG-GUID: 2zu8o9N1g5apw4Rbr_tdKvlnenglA_Dn
X-Sony-Outbound-GUID: 2zu8o9N1g5apw4Rbr_tdKvlnenglA_Dn
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-20_08:2021-04-20,
 2021-04-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015
 mlxscore=0 mlxlogscore=999 suspectscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104200119
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] runltp-ng and possible ltp-pan deprecation
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



> -----Original Message-----
> From: ltp <ltp-bounces+tim.bird=sony.com@lists.linux.it> On Behalf Of Cyril Hrubis
> 
> Hi!
> As you may have know some time ago I have started to work on runltp-ng a
> script to replace runltp and ltp-pan.
> 
> The new executor is different in several key aspects, for example:
> 
> - it can and is supposed to run on a different machine from the system
>   under test (although it still supports running on the same machine)
> 
> - there are different backends, it can run tests locally, over ssh, or
>   start a VM with qemu
> 
> - produces different output formats currently html or json
> 
> We have been using runltp-ng in SUSE for a while and it works for us
> quite well and I think that we need a larger user base now to iron out
> all the quirks. So unless someone strongly disagrees I think that it's
> time to make it officialy supported test executor for LTP.
> 
> I would like to eventually get rid of runltp and ltp-pan, but if that
> happens it should be done once everyone switched over to a different
> solution and it's probably still at least a year or two from now.
> 
> To remind you the code still lives in my private repository at:
> 
> https://github.com/metan-ucw/runltp-ng
> 
> For a start I would like to move the code somewhere to the
> linux-test-project github just to make it more visible. Does everyone
> agree to that?

Sounds great to me!  I'm very interested in the new functionality.

It sounds like I might be interested in adding a backend for running
tests over a Fuego transport.  Fuego mostly ends up using
ssh, but it provides other transports as well, so I'll be
interested to see what your backend API for test-running looks like.

> 
> Also there are two different options how to do that. Either we put it
> into runltp-ng directory to the LTP git root or we may as well create a
> separate repository under the linux-test-project and make it a ltp git
> submodule. Any preferencies to that?

If this is intended to be run with LTP only, then my preference would be to
put it into the LTP repository.
 -- Tim


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
