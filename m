Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEB73D36FB
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jul 2021 10:46:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 35C4D3C8183
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jul 2021 10:46:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6A9D23C59C4
 for <ltp@lists.linux.it>; Fri, 23 Jul 2021 10:46:09 +0200 (CEST)
Received: from esa19.fujitsucc.c3s2.iphmx.com (esa19.fujitsucc.c3s2.iphmx.com
 [216.71.158.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id EE485601064
 for <ltp@lists.linux.it>; Fri, 23 Jul 2021 10:46:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1627029969; x=1658565969;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=KJUsvPI44NCtlaQtwcB/jeAtvv0zHXAAMQPBWVVn7yI=;
 b=sp9g6pnPE9e5tdPgHwEcQjsksPFgLF+nyJ5FWtSRPA2yFxcGzMviPd51
 WG6o1ybHVeO40RCzJg8ZMsy8IAPXqhQMy47ZPJYlNQ/nuCGY+ndXWyqn/
 /Vj18bLIDkNq2gRbJ1gkCZXbVnicJTzHYgqMwJKGW5Fe3c9Z5kePDdovk
 HJgOArxyDRI1oI7EtHBKlNU1OvLG+oJ0SGBpwNYHS0X1it6RAL724lD9I
 e5rrMfCiYG8EN1x0Hwi9kiJuWGwuOHhFa9Kljt5NQ0T9OatUor+hVOLjV
 zGS1tfFfz5c5y48/rB5+m5NkDW/7ZioS8XvUIz3JIK1Eo6KHSPPHivmNu w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10053"; a="35213936"
X-IronPort-AV: E=Sophos;i="5.84,263,1620658800"; d="scan'208";a="35213936"
Received: from mail-os2jpn01lp2051.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.51])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 17:46:06 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aqfcBf+W+++I47eFQdS8RZOt38MUWtmjQwTv5frivHSlJ64faH1S9ozZtJyNWJ+uUynn6HoZcjcfDYepw7mN/KSaOlBrWA2F8F0up+KjroxDg5nR1h4xuAEsPDyG48NrBYT61p6DgtgByI4rqAH7aUqWfFtR/Lgxwnv+NaD59cP0F6Rnc0OY0Xz+88KbOzr31QfVTNXVJBOSLM6SxeEZBn5WgySeze0U31oKt9Oen+ohMk32HRUNlNQpIcODkseW34UEVxNPnAhaVs9vzG4+nsomXUAx09yrrQoG5pX6JibCprG6FH36t0peFsrwN0ViI+eTNYQrlAA6vOi8qPlJLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJUsvPI44NCtlaQtwcB/jeAtvv0zHXAAMQPBWVVn7yI=;
 b=f1ONUDuK0cJfmauZ9I0Ve/AIrD6gh25T2pnJN4q7YJdi1AqNCP2/VDYXWZetkvE8KDkpDgwKA6NRO1XNscjLGJxiXwF/LoJ4hs6YNDaTOPSPnNYqUIU51GJnS8hneBFHRV+bjJDyrnZKzUD7n3C/xJliwWFZGbGtRT82qzfY/4lUkdxSDQZkt+a+PWu3Ako68+9eX+t3v6TWlYJDSbE2ugWfwL9mLumsDlZEyTvdXaA2LHpNvdyJejYJ86n21j7aUR9Qq9HlWwiA025vHSGwAKUbX/B9AZSMCKhGpq5CHHhiD4xIto7GM1Y5zPBp0ktuQdH0PnOz3l1K0CaTO2g7fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJUsvPI44NCtlaQtwcB/jeAtvv0zHXAAMQPBWVVn7yI=;
 b=ORaa1PkmYU4mS5Hwrj0ytvhVOD7QLDJ6roIUnr1IN/k9LhUaiX1WpB5/8yw+akPGQdfsNMtWIvLGJK4qyTMTvPcskg8Q6Hbn9+3e2TIxRgynt2rCUyK8bM2U1aASUJH13lska1XXAXHrYJXcggpu971G/yIBNvQIeMStLeo5JXc=
Received: from OS3PR01MB6535.jpnprd01.prod.outlook.com (2603:1096:604:100::7)
 by OSZPR01MB6309.jpnprd01.prod.outlook.com (2603:1096:604:ef::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.28; Fri, 23 Jul
 2021 08:46:03 +0000
Received: from OS3PR01MB6535.jpnprd01.prod.outlook.com
 ([fe80::ac66:fa0f:33f1:8479]) by OS3PR01MB6535.jpnprd01.prod.outlook.com
 ([fe80::ac66:fa0f:33f1:8479%9]) with mapi id 15.20.4331.035; Fri, 23 Jul 2021
 08:46:03 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Cyril Hrubis <chrubis@suse.cz>, Petr Vorel <pvorel@suse.cz>
Thread-Topic: [LTP] [PATCH v2 2/2] msgget03: don't depend on existed shared
 resources
Thread-Index: AQHXdvMY8HjeAIx+30uV0khJgLWyVqtOr+6AgABId4CAAA0WgIAAADEAgAFK4QA=
Date: Fri, 23 Jul 2021 08:46:02 +0000
Message-ID: <60FA81E4.3060709@fujitsu.com>
References: <20210712075223.10682-1-aleksei.kodanev@bell-sw.com>
 <20210712075223.10682-2-aleksei.kodanev@bell-sw.com> <YPkkZ0Zq9DyHKBaT@pevik>
 <YPlhMeRRsNnemT05@yuki> <YPlsK8fsMI8T+H7c@pevik> <YPlsVD2gbIiX8JJk@yuki>
In-Reply-To: <YPlsVD2gbIiX8JJk@yuki>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5114d792-7bec-4fd7-93e7-08d94db64d8b
x-ms-traffictypediagnostic: OSZPR01MB6309:
x-microsoft-antispam-prvs: <OSZPR01MB63096D8A2D3EE448923E8E54FDE59@OSZPR01MB6309.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tyaIGf67rqbJayYMMlPZ+YnmTxSqto5Dy9FSIuKf7ByJDvk0hzJgtuyy+seW11X5wqp2vHGl0goUrH3r+enwadPKOqQdQPmCmkoXrGLVwkAFFG/XobKhO0wJ7zhUBzhXenUVE+znSvpFWdkU60wm0nn/nMgAzlw/vj7O5pP0Lpm2tWEBUA4lls+LdYHIlu+2lXItWmyIMIwPV/n0bvyt5wS/SHF2BASUw3rjN6Bcb5I0y732qh8rCW0BZUMbsT47jibvH+lbOqRHYmUiR+7kHMjRFwx+VmjzW5fZ6hGnmdJNj//MJ67YlbjoaUPl/MtgU6EUfSYxi7FIik10gkEJhJNZGHBHRvmxTtve7H0QNLSnpjL5CAbzt5AXJx/71xbxZG66ft9QJxRywNLk5J3s99I/9qwyuQCErhu+I/5ZHYotKmz3D8BQjnP2cf3LLr2OKrXjKifkz3JhiDq6XlK0or71Io+1O68DlZex1e5uR17m7S6ki1j/x9DOo54P8DNXu5rFiFyQPMvBW/AbSZVG1PYdJuF1p7dGWTFy5EjNdKV/cVJTnJ/o1PIIPpRYB2Fom9FnmySOAJKebaAs5s7SWSEynJVXvRcEjV38oLoQ+mKUEXyy8BKvC0kBEJ01PikZbbwcpppU7LixoYnl1Zc9teTT8Cpy22T4UubzOuy+Rl5q0b73eJLlXEF6iRQuF21xz6D/RaQnkdzgVsu3xP4ZPu9Rh3k6VGWffTlBoW80Z4f3AbtkLlIJc57UlDSjNiZTKw8goOfrAg9LiT2MFVQqPkGqIHtV++yW1wAk7j9TgPLVAfmPlRfoq1y8QmfATEWSoaqXtGLCBXzX0yVz/igyGw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB6535.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(366004)(376002)(39860400002)(87266011)(38100700002)(6512007)(76116006)(85182001)(316002)(5660300002)(66476007)(66556008)(6486002)(66446008)(64756008)(110136005)(4744005)(71200400001)(186003)(2616005)(26005)(91956017)(33656002)(6506007)(8676002)(66946007)(966005)(122000001)(86362001)(4326008)(36756003)(478600001)(2906002)(8936002)(38070700004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?NmlteWtwSTJZRmtnaHZXd3NFM2gzWlFkSFEwL1A0bDFkT3VPREwyNUlwQ2dY?=
 =?gb2312?B?TERsQWViVXU1Rjg4Vm1IdHZoVGs5elJsUXNHRkp2NFhYSlBPazRLeDljNkJl?=
 =?gb2312?B?UTAvc0dNRzZjQWFQc1B6MFZkN1huTGd2Yll6SlJybjlSZU5KUDNWYWF6d2lC?=
 =?gb2312?B?c3RjQ3RTMk5mV24vbFpLNFNWUXlvK1ppUzRSei95ZzBFRDV2L0c4UVd1UHJq?=
 =?gb2312?B?b2ppd2dhNnhzUXNBWWp6dGc0WXFqRzRQcy9sK1poeFBWU09NUVRjZFlNVUE5?=
 =?gb2312?B?UVp6UnB5V0JLZC9pTTVsYWswaENXZ3hqdlk5STI1L0p5RlRtUTlCMGdXSCtC?=
 =?gb2312?B?S3RwZDlGY1crWks2ak5ETWdYNFRsamNOL3NQZ2NoNFZnQ1ZhTDRaZTBaV0FD?=
 =?gb2312?B?Ump0cVhKUHZ2WkVHdXhSS0JjRktBVERqRk9ScjJXVmJJN0cxazJtbFk3eXVB?=
 =?gb2312?B?RmcvczB0Y0NabWJITlF3Z1RsenBZMm54VU5RZ2JiQUtxNFdtZFJteU0vZzBC?=
 =?gb2312?B?TVBOcWRIMllyWmtNNkhCN1VnNXpxOHFCMm5URUJlaFIzaGJQbDFKSytDenZl?=
 =?gb2312?B?eE0rdllza1NvLzRwVWV6VWc3VVkxMHZ1TkQzSE1zVlVQTkt3ZXF0UXdjSW5F?=
 =?gb2312?B?ZzdwbTRyK3F1bEErM2xNYVJ2bnVoZUQwSkR1V1JUazBGeXp4TUVITUJNaEtH?=
 =?gb2312?B?cm5XZTdoK2V5cTk1Yyt1b2xpU2o1VGUvMnJkOWthenQwS1I0YkVDREJCMnUv?=
 =?gb2312?B?ZmZMTUpxQ1NWTnVlTW9uNG00S01UTjJIQ29OSEdCUDdYVmJwN1FnKzBoalFn?=
 =?gb2312?B?Tllrb2FxM3lQelp3MFdueS9tem9EemxMZ1dITUtuM2NrVjUrb1c5dWZ6c29r?=
 =?gb2312?B?cTVBUnVxalNyeERWcGVMbCtvMUhZM1o4bnRQTlFpbEl1TVhyc3A1cTVSMHRl?=
 =?gb2312?B?YmN2aFNlclMwekNoajZYN1B5MTdIV2EwWkQzL1UxWHF6V0ZSeW5pb1NEckJY?=
 =?gb2312?B?UjAvNlh0Z0J0d3FheHNPTGFIa3Q0NUJxNGFRdXQzemlxaVlyYzRydVdpZmth?=
 =?gb2312?B?cHJteERnTmRGOFRBYWg2YjRlNDhHRmVrODJNVUxIWjlHRlJ2ejFucEcwTm9H?=
 =?gb2312?B?QkowT0hSREo3OE05WGcvWXpEa1lPTmJjTUNLK2dJeTdXbzY1N201Qy8zR3U4?=
 =?gb2312?B?NmVxZS9mTUtPMTZUUXBKNTNPdE1Zc09kSitNZHBzQnRuamFDUUo1UWFNWmVN?=
 =?gb2312?B?RkxiUk5ZelQxbVFaclB5MVZ5MUZsTk43NDRGa2FMMXpnMWlOOWJJekFTMmw1?=
 =?gb2312?B?dktwUjAyVTkwQmpMMkJLS0lXaTJ5L3J3VDBHNmdoZi8wa2grWVRiVnUxYWlS?=
 =?gb2312?B?b3VxUXVSblR6ekM0K3NQcE82cjFUNXJTL285bmZKYUM3aDhsd2hNY3lKMGsy?=
 =?gb2312?B?dE12OWdTRU9VN09KQ1RlSTNWNWlrenFqb01VQWVsSndRMU8zSjNEOE9kU2Zu?=
 =?gb2312?B?S2U3WUlNam1UYlJjZWw3TFozekR4OWZPQUNqTE1NYVpBU3J0Y1lhN0Y1TGNJ?=
 =?gb2312?B?TWtEY2pzckthM0NlaUNzYVNJVjJnMlNEeHZjK3c5aEV1Uk1WT1pyaVBmWkti?=
 =?gb2312?B?NGcvanAvUTJ6c3lJZU1jeTJrc2NVb0pyRHV1R2xZdmhsdTFSY1duaHBmalhI?=
 =?gb2312?B?MUEyODdBZk16M1RhUG9Ybm9pOCtnUFlDT085R2RvVFlnZmF2c2JvSFBhV2ww?=
 =?gb2312?B?ZGd0Z2RsY2xDNC8yZmNxNDNsMDNLQjNVMkhRVE91VzR1ZE9NaGt1YVoxYkpT?=
 =?gb2312?B?b3RtZXdwQTFpQzJVMmx3dz09?=
x-ms-exchange-transport-forked: True
Content-ID: <91A9389AC659F844BAAD1BFD2454926A@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB6535.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5114d792-7bec-4fd7-93e7-08d94db64d8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2021 08:46:02.8551 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W/N+wUOGX4yGWyW7yv1Mu8R/KYIA0cna52+d74tGg964iFX5b0SNGuy2ez881pVLD35jvBtJ5yNoVuvGDlNehPyp/XNDLw0FnXbT7bIBRVc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6309
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] msgget03: don't depend on existed shared
 resources
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

Hi Cyril, Petr
> Hi!
>>> I think that we allready discussed this in another thread:
>>
>>> https://lists.linux.it/pipermail/ltp/2021-July/023831.html
>>
>> Thanks, I forgot this. In that case my approach (not using<=, but count
>> segments in /proc/sysvipc/shm before testing) might be more precise.
>> But no strong feeling about that, both solutions fix the test, let's chose one
>> and merge.
>
> As I said previously, there are many SysV IPC tests that do expect that
> nobody will add/remove IPC shm/queue/semaphores during the testrun and
> some of the testcases cannot even be implemented without this
> expectation.
>
> Hence I wouldn't complicate the test here and just count how many
> segments are there at the start and be done with it.
Agree.

A possible solution(alter get_used_queues api in new ipc lib and add 
file parametrers, so we can use this api for msgget03) I have mentioned 
in the previous email, the url as below:
https://lists.linux.it/pipermail/ltp/2021-July/023653.html
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
