Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B18B3FC53C
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 12:09:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3B70D3C9A58
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 12:09:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4A2A43C2A1E
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 12:09:14 +0200 (CEST)
Received: from esa7.fujitsucc.c3s2.iphmx.com (esa7.fujitsucc.c3s2.iphmx.com
 [68.232.159.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 8564E6009DF
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 12:09:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1630404552; x=1661940552;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Qwyga9fP5k4wlWCFGlzyCIZLaaXMiNnFzcZCnYDHQQw=;
 b=PubxA70iyUO15H4ZSNmwIMW63N/F6qBytDlkvHsaN+pb7f8zdZFsFPtm
 gIl/5W0SBKVxwbNMKkQj0TMRLD+J+d9r/rxYgHNkB6aFJiZdIlRYdQ63Q
 g3y/gMvpRHHdH+hWCLZGWaL2SnsnYTIQG6OIOVqQXhXtFNkhoDtgB6reF
 /1/KkdR7qi5hQKkd77EuC+dOg0E1YGZXSbMn6d4oWOCcvdkU5B0HLWMYM
 CoKrQF9ZbF2ivWs4DdY5yZhO+fflLax7vEAHX/6W4taOjPL3Fb0IVLg7T
 zF5dXLy+Kfatqt9gomSZs+W2phQyOcxMfeQK3EeTa0aI/MLHklvWuyW1n w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10092"; a="38062926"
X-IronPort-AV: E=Sophos;i="5.84,366,1620658800"; d="scan'208";a="38062926"
Received: from mail-os2jpn01lp2059.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.59])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 19:09:10 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=foRmObLwKRtspX+Q91BCVc4kFtFB9XObtYpSSJDxvLssaDVhZird4ycZ+WTA9kwYaMfMlJ7axls9ZYxFKnW//r1rxBz+j906HXOETMy9tsSpuynShrZmmWeIhxQ1JQ1H57mpOP/+P94DNklLO7FVmni3Ywn9eHjCgJfw2PKQ+dsjTdGBx+jzjrQ4BQdJ2UwQUnFbuE9mI0n5P/NfBEF3OKKisxjBW/cW3SvRXa6bcvAwrEKyLd+QmQeqIorCmugfLj+OZe6ol3+qjd5dP+rDZbg2OI7NM2FoD10ve0Xg6eVwvN3PY8fyQmt0C44xra/7pl5G3YoH/+4bsRAGWhd4wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qwyga9fP5k4wlWCFGlzyCIZLaaXMiNnFzcZCnYDHQQw=;
 b=cFGDRng3Ems5qBvn8RpwJ4OwcpBemQj1HbgZykZDheYRpb+a0siXr5G/gYHuk8lzy11Ac8l2Vu76fzIK6P93K66M3DM3nO75pv22TIa3Gnt0JriMDrfsfi6BGOkU6y/7MeXpwNHu0Z87d0R2vWYqlAQi6B9xVu9LIKhNa+7j4zcZq9JAyvn0je0gj2ESXDEl3i5gV2wLK9BEQcYIeeDkcchZXXSwMns6Mj70jAXG3WAU7sYcz24L68oogdRHIA6FVz2a8CF7VzTpNsRZzfxj+gItO7Aos4aH3lJ7nU5WbzrLiDnXW3W9wKLFZlv2Eck0wwBzdlaAA/TL8/V5PQLCnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qwyga9fP5k4wlWCFGlzyCIZLaaXMiNnFzcZCnYDHQQw=;
 b=epW/DncjvlQF1tUhVw63XzgnJP4/1nuZtZrZV1TC3KctcASOD0/bneODE7uxBOcwnV3giJiEuocPv97MiTetVnkwdIm64/3P0F6vIJzEN4kgTP1e/C+h162+fMj7VLaM67Y3zU+OowDCrHx3MYJ4CTMD9AzrmYAWBKyiOehTp1Y=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYAPR01MB2320.jpnprd01.prod.outlook.com (2603:1096:404:5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Tue, 31 Aug
 2021 10:09:07 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::783d:cf1b:a4b9:5791]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::783d:cf1b:a4b9:5791%5]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 10:09:06 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: "rpalethorpe@suse.de" <rpalethorpe@suse.de>
Thread-Topic: [LTP] [PATCH] userns/userns08.c: Enable userns in
 max_user_namespaces file
Thread-Index: AQHXk9oIkQJYKCiRIU2gaINj5a0vnquHNt6AgAZCBQA=
Date: Tue, 31 Aug 2021 10:09:06 +0000
Message-ID: <612DFFDE.5050800@fujitsu.com>
References: <1628144855-5924-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <87h7fbkwe8.fsf@suse.de>
In-Reply-To: <87h7fbkwe8.fsf@suse.de>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 57ddf9b5-8995-4948-7ea4-08d96c675e54
x-ms-traffictypediagnostic: TYAPR01MB2320:
x-microsoft-antispam-prvs: <TYAPR01MB23202C8A6A85574E29F3C4B6FDCC9@TYAPR01MB2320.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1MQ6qnu5Xb4XQUlYrKoUq0hUkmlatEUIboSNGAHb7L7NuGnoKwQGLdxwFbZbFsc/Tqkp8PSWfelk7FFOPIY3uywX9UIYvoLgC0+elGk8dnBu84hhJuXPSNKnndh+r33I+u/t/gDGmR6q01K17c6kal2Yvz7ko9oyjYrgzit3t1S24mtvBUIjWfElqbF+ADiYJkhlFvwcQaVSVHeg7STXaYrqEzV0/7LlD4YifcXb2E38XG8XljCp8A7XpZFt77b1abzomWPKEGb/o2VJIDSymGjSM/dnFhpZk5Q7BMubPkPmE0ZC1vfotAzdcK2dmeyD8KwDng+JzRO5fIoV3Aq/HZlqDr8MmXJRAKa8RpgoEUjv37gazS7+C1MOqb5Aa9UFXQUiU9/aelr683VPy94ZZj0O4h5s9fAR5/2IYo4/ILLFhtRGdmoSo4Lp6/OQO9jehT8TtCgM+eT+lsWOwBqe2kL6aWd2IstNCOYGrDHowdUiQMUO/S0NYG8Z6c1VBBtt1JSQb23cI4XPwKA5xedqxgG5DwMK7W8W0uXBwjEhYZ1qTv1x5iG1igpW24NXktsfk64QUdklmLHwjKC6hHTsbTabqpagUGW2qxJwF7iNrFz3W0b1uGH/hbVG7+T8xvrS7DZkPhPphzkHdXY8xosh6dQUlyjLO8c4yQhIKSB0D6QOSOW12uVvNcJq5DAEqAscAukawHBtEWBDu9x/nXK8TQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(376002)(136003)(346002)(396003)(86362001)(6916009)(186003)(6512007)(26005)(76116006)(38070700005)(2616005)(316002)(33656002)(85182001)(36756003)(87266011)(4326008)(91956017)(2906002)(478600001)(66946007)(83380400001)(5660300002)(71200400001)(8936002)(66556008)(66476007)(8676002)(64756008)(6486002)(38100700002)(66446008)(6506007)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?ckpxNlcwL0NrWGVrRm12L3laalpDVGw4TDVYemFvTnhpRXMwWU1XQ0NKUXZz?=
 =?gb2312?B?blI5dGNQdEpPWjlCQ2VqbTgwam1Sc2Q3cCtJZ2JhbExrbjBuY3czSDNrVjE1?=
 =?gb2312?B?Nmo1VW1QMUxuZk9yMDFiSXU4anZNZEFFd21rOUQrK043VHBVeUkvK3JDS0NK?=
 =?gb2312?B?L2lUYktBYzZER0Q2SEpLa0hNbWdNTmZqN0NmSkZoS2RBN0IvaWRBcmNzTWFD?=
 =?gb2312?B?bkpLUVNXT1UvSmFIbTNSVWJESDFKOXYxNms4WVJ4eDA5ajBZeG1LRzE5UTNN?=
 =?gb2312?B?TG15cUZORDRHT2RBM05XUjdva0R6VW4valZkakY2ZnR5d1dDTW5lVUR5UWxG?=
 =?gb2312?B?d3VkMVkwaWhvamlqczFDWTFhUFJuTDdBNFhvbG5yMjd1VFF3TDNCaWwvNGhW?=
 =?gb2312?B?YzhPcHZKSlhJeUw5YkMwTlQ1N2RTdmZIRDRuSmNsaFR4YTA0Y1M3WHk2Uk1K?=
 =?gb2312?B?QVEyM01yYlBOa1JGWXRCaEpoNS80NXVlT0w4OVkyK3luZS9KRC9zV0RwazBu?=
 =?gb2312?B?ZUJmS0VyMG0vVDJuVGx5Y0h1Y09HazZlT21TSC9PblViUnFJaktwQmJ5c1RG?=
 =?gb2312?B?Z3NVMDBicTNyRWRJMmZaZnhQT1FnQmY4c21XMGQ3NGlzOFExdTc1Q0hmQ2Fx?=
 =?gb2312?B?SzNJTnFURnRuNm10WlR1YVE3OXJBb3Z0WVZOay9VRnRjOG5jM25uS0NISzJV?=
 =?gb2312?B?cXRJNU1EcU5lSk9aSFE1VU9pS1BveGJhU3locENSNzFzYS9FOFVSV1hjblFp?=
 =?gb2312?B?ODlKa1BGck03cVVMZXd0a3Z5a3hpbmdTbTJLVXhJbnNXdEwyLzRvOWo0YmhQ?=
 =?gb2312?B?eE5xUytCS2ZEdEg2RjFDQVNueHQyejJWSk9lVHBnc0JLMlRFM3lCRHMxdExS?=
 =?gb2312?B?NWNTYmhSQ2xDTzdjbWFvS2ZoUThmcHIrYzFGUExBSjIrdWZjK3BiYkVXbDlj?=
 =?gb2312?B?bnFqbllha1V1SnFlSDY5MkJmWHRCUThyL1Q2MU51OHlHZkdiK1FhVHh3Q3l2?=
 =?gb2312?B?MjhuQTMwOHRVZkw5UGZtQTNVZFBlcWVTL216QmJlTk1Db1V6WXBvekJWOFNl?=
 =?gb2312?B?dTIyZDk2cHJBdkRHdDBGU0M0SEZQNHZidE85OEhVSksyUzhjNFE2aXcvV3ZJ?=
 =?gb2312?B?MEFNVDRIRkVVWXF6dlpiRWl1TFUyalVHQlJIODZaSzZqRml0cnlnM1pFcmYx?=
 =?gb2312?B?c2FaMFE4SEY4UkozamxNaklwVnhVeFlNd2YxQ0dGTUE4MnhwKzdmMUhYd1lJ?=
 =?gb2312?B?L2VUZ1J1V0s2cFF4UkY1N3RDZDRoRWN5d2NNZy95aTZ4VmdHdjB1UlNocGRH?=
 =?gb2312?B?RUk2L0grZFhuTDdYb0cyWjFHdm0wOTk3RmdVWHJxbHh3OVhLZWhQQ1NORzRk?=
 =?gb2312?B?TlZ0TUlQVzdFSlRoRWt0Uy9HWHpCc2JYdGFYNEUxVWpyZFlrS2lMSlByNDY5?=
 =?gb2312?B?dzFSeVVleEk5WDk3d21lRXFnZDFBSmQ3c2lVZis3MnYwbmorZXlSRzhLd1Ru?=
 =?gb2312?B?MmdBc1ZFSHAxYXE2N2Q1WjgzYk5BcjhYNEJpNVh6OVRGTVhnbE9oTXJ6MjZG?=
 =?gb2312?B?bzR1UDFGaThORXNkOWxZN0R5ck1pTUc1cVpJenFBVzhOSm1oYmdJRDU1Z0ty?=
 =?gb2312?B?ZUNtVklPdm5Ea1pVc3lBOVlSeW5wYXI4eXh4b0sremljNzJaRGtxYnlYb1BE?=
 =?gb2312?B?RmJXZ3ZSenVCaEJVMDVXTUVEMG42QmpMWUxkV3RhcVY4T3U5WTgySDNJRmdC?=
 =?gb2312?Q?h2639I8v9YRufKvQa8CR6mX2NnhMH+8qujvBX05?=
x-ms-exchange-transport-forked: True
Content-ID: <51FC152AE96FF84A8039688A80CA5118@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57ddf9b5-8995-4948-7ea4-08d96c675e54
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2021 10:09:06.8537 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V8lqR5FjKlumiRKAFAJ6Om5J+QdxKr8Hf3WqFgTsJ2NuihLiveNd7m9cFJrxNLZcahMkTwxMIH65w6Zb7ndbE8dfoYH+jIFbDFH+P8IJr0Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2320
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] userns/userns08.c: Enable userns in
 max_user_namespaces file
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

Hi  Richard
> Hello Yang,
> 
> Yang Xu<xuyang2018.jy@fujitsu.com>  writes:
> 
>> On old distros ie centos7, the default value of max_user_namespaces is set to 0.
>> Enable it by increasing this value.
>>
>> Signed-off-by: Yang Xu<xuyang2018.jy@fujitsu.com>
> 
> Looks good, except for very minor point below.
> 
> Reviewed-by: Richard Palethorpe<rpalethorpe@suse.com>
> 
>> ---
>>   testcases/kernel/containers/userns/userns08.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/testcases/kernel/containers/userns/userns08.c b/testcases/kernel/containers/userns/userns08.c
>> index aedfc6c4e..0910ea7d4 100644
>> --- a/testcases/kernel/containers/userns/userns08.c
>> +++ b/testcases/kernel/containers/userns/userns08.c
>> @@ -120,6 +120,11 @@ static void setup(void)
>>
>>   	SAFE_WRITE(fd, 1, "\n", 1);
>>   	SAFE_CLOSE(fd);
>> +
>> +	/* The default value of max_user_namespaces is set to 0 on some distros,
>> +	 * We need to change the default value to call clone().
>> +	 */
> 
> We don't need inline comments like this. In this case the commit message
> and git-blame is fine. Other times the style guide requests it goes in
> the comment at the top.

Thanks for your review. I have pushed the v2 patch with your
reviewed-by(increase this value in more userns cases.)

Best Regards
Yang Xu
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
