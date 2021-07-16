Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CDA3CB41A
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Jul 2021 10:26:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E81783C6AD6
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Jul 2021 10:26:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9404A3C5747
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 10:26:52 +0200 (CEST)
Received: from esa1.fujitsucc.c3s2.iphmx.com (esa1.fujitsucc.c3s2.iphmx.com
 [68.232.152.245])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 2A2B42010F3
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 10:26:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1626424011; x=1657960011;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=T0eVZQJ/8cCx8H4SvF36MSy/HS+pxJtUlKBDIiYFyjA=;
 b=yICEVB2w+ukqowCgHLszDgRfsssvEAY8OiW9zX9NnuGVK22wH4hnd1zB
 mq/hFTfuAstgH1yI4AMM758aZKXIgtW20EoChbfbscY6AEmSQJJV7Js5R
 AiWJSXz8MaboaoHiP5Kj0hihyaKZUvOJUOuCg5HInFQqbGIRyrIw6eNIP
 ZO7MWSN9HvAC8KShhat9RPDZcPHyupD1+MMz23Iiz4pgsHEMID3r6xFIz
 X1z0nQB7rol3Trq3TE70c0zSOWzKirladwd5u7FVzJjKcB7scYm739X+M
 3MniuQnHfRCxVB1Y2YRv/L6H1ND8eKkHZH22EpVBWB8eUzEhmmW52wEV/ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="43276930"
X-IronPort-AV: E=Sophos;i="5.84,244,1620658800"; d="scan'208";a="43276930"
Received: from mail-hk2apc01lp2054.outbound.protection.outlook.com (HELO
 APC01-HK2-obe.outbound.protection.outlook.com) ([104.47.124.54])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 17:26:49 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LWmvlFNOOpulV7kPSao/3hB+hMQrsNAuf5qV7yGxNno5x59RgUD+21X9WNtgAtsQ9cp8V0R765w6ZRuc8oVSy06gvAqybzAXhCC5xuSiYutrW+Dj0iiFSEAcS8ZjblZ/Zr8oThkwXFscXiqFjkU5L7ZMNdOZ0y2tTR5SMwa0YA0PZJRlyJdSh9L76qfKqMWsw7xlagxjn/a/AHG1Jbhy7fSzHF8NuJvWXu3VrGtp6pUJ5AHXDseU7A8Z8ihjnGR9lcpvIuBxo2JFDVr8EaAQocd2R3x1c77clblQXjD17SyH3FCgvJHfIe1iw+ilKoCKW+e3RD5CC14hSK+pgz95Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T0eVZQJ/8cCx8H4SvF36MSy/HS+pxJtUlKBDIiYFyjA=;
 b=fJd+g1LoE7AJ5AF95BflhXC9Hzsp0itq6H7L2Luj7nds9ja2FDVgvNEgxN+Xdi9BCQ8e5ZgylJ0qXeqeS5r91IoTsaJ5hN8XwgeAVBIswCwZq8pq2c2IfJbRD4mThj20BgyJCXgNJqJbIOlKn8wKlqgjkaNBLhiSTzdKTw8fuQprosAVnB4wta6q/8GqL1MQCdbmn+XtljUvuw27Rr3O/BnOWUokxhjkPR6K2pRsL4o7YiAiMuM2cGfz4EeB1WSOIREF7JN6N/wfYy/hf/ZWFG51zT94rMIxUehL/iBXgRitVDBGuOYIvkwD2Blv5cZRfgBOiWbDkjfVD4zDkopx6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T0eVZQJ/8cCx8H4SvF36MSy/HS+pxJtUlKBDIiYFyjA=;
 b=KOEN72p62IV4jpV+ilBYt7dDgMw3HJ+wnVuThltMhzrQzpJ7JV5jyNCh4quVKsMnpOssjlkNnPKKbd/J3tU7wQ5Ocr89FAkCRlBNLaFOLJswa1i1jxM4Vrdt5/Rka3T0StWyb0tCmQRh5W7lD7DdoLF3mkfWVRIMZHkU7KQOEV4=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TY2PR01MB2682.jpnprd01.prod.outlook.com (2603:1096:404:78::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Fri, 16 Jul
 2021 08:26:46 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0%3]) with mapi id 15.20.4331.025; Fri, 16 Jul 2021
 08:26:46 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Marius Hillenbrand <mhillen@linux.ibm.com>
Thread-Topic: [PATCH] syscalls/ioctl_ns05,6: Fix buffer overflow
Thread-Index: AQHXeRo64UJdpHGLGkyEA0Z2OGas2atFRCiAgAACXAA=
Date: Fri, 16 Jul 2021 08:26:45 +0000
Message-ID: <60F142DA.4060308@fujitsu.com>
References: <1626313169-30611-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <a0c00c11-1d50-2eed-131f-cc74798ebf03@linux.ibm.com>
In-Reply-To: <a0c00c11-1d50-2eed-131f-cc74798ebf03@linux.ibm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.ibm.com; dkim=none (message not signed)
 header.d=none;linux.ibm.com; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3feb202d-e1a1-449c-9cac-08d94833730f
x-ms-traffictypediagnostic: TY2PR01MB2682:
x-microsoft-antispam-prvs: <TY2PR01MB2682F15E839DC09AD2197072FD119@TY2PR01MB2682.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:639;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oGauWHVZJfXEaZiBbcD0UPgnpqIUYNpyt9wZ3qJRBGFivrFRY5Hy94tDKA5P0L0O6TrKtpu37WhFLZ0UWfARN+aaA64YqnlXq8hdt9P7s1xJId+VLlOIOckaWfrn5B8/IM/Os1Do1v6SodL3jey7Rk/FNpIA5zmRhY3wITZh0AMYbuWFnh2J64qcOfrfQrJYv8JnSwzCeT1TulJBxFFGpLMHdwXVLa5seENstFjcZptuu4kLLj779EXprbbQcEMl6v9jzOTcF1gszk3I6axUg1Xop3H5W3S8aXDMcUnBw8SgaaJeAme62XuX8/JXSBrKkV0aN77WPqgIAw5+oxqjPgUkSciY6uDyM9N7VuckGUtDOMcQ/QwSMooYS2/A3377WrtMB6ai3izorOE/dtC+Oan/x7l2i4gMng2OBgp1vnB0FM+5u0gjRPkKXwr7GbDTH29ko8yxuJNF0JZc/k9mJ4kfoQC2B47HOkzk56JbqUgPtV/YdK8NUnCHHAY3V1YNvaDQ4nXxDkcdG93u6SJDGrMQDvSlzPtz/deZL0mBJ8T4E2fN6Etiv5gWuMlXoS4ZR5TXm+IWrGkdPY7u8Ag5MgjLI6KC01fIgoqB85pZzHRQmzw7ljS3rIOTAecQzteHxT5YpQXykyq1YezprQdwRpGqBzoC4/fV0Dm1SNmk7QZfai/JGvE7saG1EsPi0B8uVFskUleX4ctrJqTRXl2U0w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(396003)(376002)(136003)(346002)(6486002)(6512007)(8936002)(38100700002)(186003)(4744005)(5660300002)(36756003)(8676002)(122000001)(76116006)(26005)(91956017)(478600001)(2906002)(66446008)(64756008)(85182001)(71200400001)(33656002)(83380400001)(2616005)(66946007)(86362001)(6506007)(316002)(87266011)(6916009)(66476007)(4326008)(66556008)(38070700004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dWp0OTRPYkNkU1hrZHJoSGxJd09DOC9RK3RmeWM1UWlJNllDZXBxemRYaGlu?=
 =?utf-8?B?cXhkTEhMMm0xY0Q5aVlaQnh4MzRCSllmWTdJbENqM3ZIdkVobEllSHJZUG1z?=
 =?utf-8?B?NCtOaVJiK1RSYkRWeVo4M1c0UWpMaEphZGdIQ0QvZ0F0cFlpWUo4TFUwS0pl?=
 =?utf-8?B?Y2hoMjJwMzVhdmY5SXRRQnVxUWlyd2lSOVh1c0t1eVdMZ29nWUdka2llS2tk?=
 =?utf-8?B?R3JsKzhBUHlLc2hqU2MzMHh5dmlLR0FZelhFVDg1NlZxWkVvTVhuUEpMNnNu?=
 =?utf-8?B?M1pDcDZRYXBiVGx6N2JUa2gxTkw5M1RpOTBRTXdseU9XdW1xa2c5Nm44MzhQ?=
 =?utf-8?B?Y01MQWEzdUQxMi9hc2x0RXhBZG54R3d5OEJQbk5VbEdjY1B5T2tXVGg0NWp3?=
 =?utf-8?B?Y251QzU1NW8zeXEvS1UxZU1oakJKbzZFRkhVdlA3dmxVb2ZUdTdaOG0rQ3dH?=
 =?utf-8?B?VEg0MWhsUlNUL1FTYXcwOGtOOGJmVmVST3ZIT0Z5aEpsZDZKNVpRYUl0dkZ5?=
 =?utf-8?B?UFVuUWxlUW1NSUZPL3RnamlZOVR5UHdPR1NmMGtTUDdKcVlETDlBbVA0Mk9r?=
 =?utf-8?B?d3Q3eFpiQytMdExYY3ZJaTFkSElmaytIRG5jTUFHaTBXZnpkM2cyVno2SHh3?=
 =?utf-8?B?Ymd6SDgyL0hseW1hWHptblhIalQ4MURUUUNEdWtldzRCdlVQZEo3TkY4Qnh4?=
 =?utf-8?B?dm1sSDFTa053R0dWOWRCLzFYNDBGT2ZYMUl6aXk4USt5Y1laQWwwWHRrOWFN?=
 =?utf-8?B?dHFHKytFb0VmL0NIcnJTUndRbWJtU2tZOGxlZXZGZGJpYnZRa2c3c1pwcVQ4?=
 =?utf-8?B?d0liK3lKdHh6NEswNnpHVEZpdytwd2JoanBhM2pZbFZXaTRMOExobFlpeEpH?=
 =?utf-8?B?NVJhWFNwN0NDbHljNWUwcVc3TGxjS2ZNYjBKR0xtZnhVOWJFaGs0MlRKUjBh?=
 =?utf-8?B?V3VQa05OSEE4T20rcUNORzNwYldRVXNuMFEvYlR3MWVveWdjVzI0UVNJK3Fo?=
 =?utf-8?B?eTBRbnBvTHoxK20vc1liZnBBUmhxa2tucDczRy9BLy9peklRcTQwU2FDR3g1?=
 =?utf-8?B?dWpRcGtzVExva29OazRjL3dvajNtQ2R3dHYxaEQvSkpTeTNzdiswSkZlUFVk?=
 =?utf-8?B?c3ovTURUeGhzTmtQU20xN1lVRllvRTExU2oxRWc3dDkzU2M3TGxDQlNOTDVL?=
 =?utf-8?B?Y24rdVRJeTZNOUlvM0xVbmtYNk5ha0FyNW9POGlRNS8wQ3JCOTlpR0FHM0pR?=
 =?utf-8?B?R24yMUtSaHBkM0FPb1NCSTdRYkZlVzBSQ1dPNEV4N3lUL2FFeFJBNENHUXpI?=
 =?utf-8?B?STU3NWFWYytlV2pmdmp2TXlNZDdhaHVhLzhBYzJYcFh5VmJ4cU8yMkxUMkNB?=
 =?utf-8?B?RTJ3YjNIL2xCem80aVpSTW1obHdBSHhXaUcyRFdyUFJJNk05RzhSUnp4UDY5?=
 =?utf-8?B?SDBrdjF2aGtoVStmWXN5Y3M4WmxBMi8zb3huSWxYdURPQkczS0NjUTdJUHFu?=
 =?utf-8?B?SndPMWYxM0o3anA5UVI0MEdLZ0VNQ2VyTjl5WmdqdU9zWWlNVG1TMkhIeDQy?=
 =?utf-8?B?b2E0bGJrYmIwK092SWJDTjVIOWpONjB6aVVXTFpHd0NKOUVNQUdQdTlUc1RB?=
 =?utf-8?B?RFkyOUdZVlhQS0VmeCtvZW1OMUxpanpmdXFzWmZUVjlvZzl0SFdMYWx0RTBJ?=
 =?utf-8?B?dHVjTzh0SEFYMmxJYmE0QWRYQXByQmkxZ1VCeU5STW9FQ21LcmRzeTcrdWxT?=
 =?utf-8?Q?k57aKED5FeZByzT6wSOX//O3sL1kqmXpuIdJq0J?=
x-ms-exchange-transport-forked: True
Content-ID: <1DE8B90921AF87409595350EDFC8B56B@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3feb202d-e1a1-449c-9cac-08d94833730f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2021 08:26:45.9714 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yMDiNrxqbEid94F5P7HBlqLavqG7/fWzTJRUQXrCGqV+ZSbCBPI+dFOGn5E572Q7XZQpaxkToecLtPiG301TDkxs/xMkgtI1xZUoJDo9et0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2682
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/ioctl_ns05,6: Fix buffer overflow
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi  Marius

cc ltp list
> Hi Yang,
>
> Thanks for your patch! I had missed your email before submitting my PR.
It doesn't matter.
>
> What do you think about also turning the sprintf() into snprintf()?
I have no objection for using snprintf.
Also, ltp usually accepts patch from mailing list instead of pull request.

ps: cc ltp guys, so other maintainers will know I have no objection for 
your patch.

Best  Regards
Yang Xu
>
> Regards,
> Marius

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
