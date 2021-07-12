Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4833C413B
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Jul 2021 04:32:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 081403C78DD
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Jul 2021 04:32:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 09B3C3C29D3
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 04:32:01 +0200 (CEST)
Received: from esa1.fujitsucc.c3s2.iphmx.com (esa1.fujitsucc.c3s2.iphmx.com
 [68.232.152.245])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id AAD1160071A
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 04:32:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1626057121; x=1657593121;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=9A2vslfOZVsoDSZe2sk502earBzi49qmsfdM43nvi9A=;
 b=qHU+wXplF9X2+7QF+2fgGF9BzE5D3hnH6RWiRTbosypUXR2fV89zC6O1
 heRNWQrUcaX2ptFiJ2+ivmC3fd79d/8H0z5lgbBNxQNz4AJRPgheSdefG
 HIr0b4GmnC+IT48/bO23RJFH/qGzXKu5fOmRmiBiS3bnz/qnYlMBjiFWR
 dUuhW+lizpvuV+YFpMbpuCK7kEu9yZfNiDJAOAAnXtwhuCCs5yoQV3EvT
 R26MuwBO9jBK0Hsc1ItzFf3K4hKOvgocL6VWYugVVbT2T2McJHKu/Ei+c
 JrEztex135pBWEdCppcuWfD5YeDDuhOzPzxzbdtilMhyF+17UKoiI9g80 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10042"; a="42924609"
X-IronPort-AV: E=Sophos;i="5.84,232,1620658800"; d="scan'208";a="42924609"
Received: from mail-ty1jpn01lp2059.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.59])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 11:31:58 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DNfYOLDXgovpb2bhpU0HyiRvaduHlW6Ysl3RW2NA0/NyFjyZtYWoagw+PxFp5qJx2jn8dMhD/ZJyZWBs5Oe57jxuJAUObnnwgrVDMf0qDOrwuy9pC3yppv4BjL3BLcEAV1Sn8Rpkd7akTVi8jLCIINuFh2c3s+/OJILNfxZi3QJFDXNNWY7RJLm9as6GDngTaYeuCc1PeNxnDkCwISmf5HRC9Hx8KI+GVnmHrvfh4iJN4CtcmPH8cGX8BzyuK8sEQox8Wa4DInJliHwZFSA/CrjpT9/pYpZbGlP082qttQ/85uwhs2hf1UDTYodAZNqUhlUR0Rntyy8XqZd7/64szg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9A2vslfOZVsoDSZe2sk502earBzi49qmsfdM43nvi9A=;
 b=LJuLOhaBBqnS/mKSnPA0N+U/9zCDJM7ow1IDnrjr5w15bTzF5jOYD5GPXvU0lso+taxt6pbp6YZ1Sql7FGij7uM3ir21p0Q8cplY0sj5NVT2Dr6GUFbXylIy3Qb6AKKvbNE1RFQomkslpvhAxmVdYayzZ0eW4pdC84KmwFCx7xFDR2k0t79k8DZhhQd/3yChcSUc2UztObxNx46k6bTi2ACkNiPR+jVgOBUhxLq70Y6gdhfhW/OLEsAX9eiByBn9jH4h3wgwEKSiDwbkfnUbd59fODHuAgv78YXaCxkl+uY2WdDpVFujv0h3jy1ZzVs9njRfnsRqqH6jz1KZgRebWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9A2vslfOZVsoDSZe2sk502earBzi49qmsfdM43nvi9A=;
 b=Ep1fhuLJqAS/wg2RiwFUvK84FKy1eijL/UiU9HCreN1XiuUt0FdZ6CLa63xkhyG2lbUgVTQSsWbOFTiQozNVqf2Wsgp9Na3NcDdjDcIuqO52EQQ24ddl/AbdtgjpK9WslC7gHZ7w1OGDJmSdnqJAo9OigWsyyl2pbW5DDJw2I1M=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYAPR01MB3678.jpnprd01.prod.outlook.com (2603:1096:404:cb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Mon, 12 Jul
 2021 02:31:53 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0%3]) with mapi id 15.20.4308.026; Mon, 12 Jul 2021
 02:31:53 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Cyril Hrubis <chrubis@suse.cz>, Petr Vorel <pvorel@suse.cz>, Li Wang
 <liwang@redhat.com>, Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Thread-Topic: [LTP] [PATCH] shmget03: fix test when some shm segments already
 exist
Thread-Index: AQHXclX8FtNVc6CAyUCt+wJTvZ4uTKs15fuAgAAPCoCAAAnXAIAAupwAgAAJiQCAAimsAIAAENaAgAWqKYA=
Date: Mon, 12 Jul 2021 02:31:52 +0000
Message-ID: <60EBA9C3.4050103@fujitsu.com>
References: <20210706105758.43220-1-aleksei.kodanev@bell-sw.com>
 <CAEemH2cOm+1BMWE7oWVFttXNOeQsYk9veXePS+ctxAABk2rCWQ@mail.gmail.com>
 <c2c7ff46-df28-c7b6-49dd-c891d9655d00@bell-sw.com>
 <381b8420-3dba-d7c1-027c-e2e2adc719de@bell-sw.com>
 <CAEemH2fcubrbMpeoeSJJoZtD+xaiRrs_upG_+KQXB_8C9m3eQg@mail.gmail.com>
 <60E50AB4.7050404@fujitsu.com> <YObbKCNKUoC7lSxd@pevik>
 <YObpRzTjx8T2GAZn@yuki>
In-Reply-To: <YObpRzTjx8T2GAZn@yuki>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: be15ff47-6a55-4f90-5175-08d944dd35cc
x-ms-traffictypediagnostic: TYAPR01MB3678:
x-microsoft-antispam-prvs: <TYAPR01MB3678F3FD4593C3B201B19DFDFD159@TYAPR01MB3678.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /HPWSgnJbG/lZyXM5WmdBaJSo+akHB4yOTWtgu58CFaqc1QLFyqQKpir6S88CjR2q2ZFojGjHaB+0RGZO6P7E/fKW3jjwuQNVasvSgaOHZFkQ4ZRmxm/gpI8lr6ivxuLwFl+HCdD9Trx3QU99RmASsk777ekjBzI2Si2jqCSDZE1WMJ8SVZl5bzHnyHwGY4GkusLx4f6PX5iZXPn5Qa0EsJd0RSla0iPPtZ54UPMWfGefHljRuP5hZhJdHDtUsKKJszOqx3X/uyauulgWTdyK9+xulgKMlWD9irP+pHmtu2QYbkczul86MMEj/vDYBQGL6wq4KVnJVjrVVaBGmznDgMA8/Iu0Qo8XmaQHd9vm9hox/fX8x7Q7Tby7we2XtGXCZTEA46bdTXo7yxEXQYc4UUWYLd3B3MGDxSVAc6IdN3Q+NGuNOn/SFmsS0eM0gJNbjMB2aHjqgRKy4WJA44xKUXJHNqehGQ9CHgxdiDhW+0pjojMVhHup0/LQPaAxHuyXUbkXZd7welDk47OBmpxfnlruYUJ4X/Qo4iIJueOcynQVgpp1nfEXDF2jM13ksOJhLSBEJB1wbZUAV9wB8RYeOPYIbPNe6NirbnWZ9WXpjQH1bdql4xqm3qVt2wPLKCGKDVoz7rjkgv3zUou8+VXtg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(6486002)(8936002)(87266011)(33656002)(66556008)(26005)(64756008)(66446008)(66476007)(66946007)(91956017)(4326008)(6512007)(86362001)(6506007)(2616005)(2906002)(8676002)(110136005)(54906003)(186003)(316002)(5660300002)(71200400001)(478600001)(38100700002)(122000001)(83380400001)(36756003)(85182001)(76116006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?OTNZYjNrMkVMd3NqTm4xMGIzU0FVYTFXSDJNSDFTUkpMUzd1YVFWOGJXV2s0?=
 =?gb2312?B?bVBqdUZIRWtCOGg4bmtDdmwxK0cvZzBlWXQ2WjhGZTdNTldpc09laFpjOHlW?=
 =?gb2312?B?Q3hZck9KalE5UVBDOEdMQUFxVXZBV2xWMlcvdDRtVTcrelBuNkkrUWpMazFt?=
 =?gb2312?B?dHFiK0JHdWhQUXZFRXJSakhyTjVhUkpacWJTUGJvdi9BeWx5dWlZZWZ6MDRw?=
 =?gb2312?B?dDVYU3FWSnl2VlRFWUhhM1RBVkN6UUU1NTlwWmMwSzAwVWpmZ1VlTTVsVkNa?=
 =?gb2312?B?MTBML1RqRi9RSVhyQzY5QWRtNmRUdkRGSWpweXhKS1NLaGI5d3VzQ3RQeE5I?=
 =?gb2312?B?cFViSTFHTm5wT0o4ZXRpaDBDRE5aRFFjK2M0d2h1WE1IMXBKeUZoK0Z4ZE0z?=
 =?gb2312?B?TzF6Vng3YWpMSSsrdHJ0d3Z3K0dQRGxkQjYvUmZtejhuUmhrSGJwNk12eXlO?=
 =?gb2312?B?L0FaQjJSVGxtbEhFRjEwRkEzb0Vtdjc4NkpJdmxIdjlkUWlkSUFaQ0l4N3hC?=
 =?gb2312?B?YmtTOXRDUFdGWDFwSlRvNW1IVXA2eGs4ZzgzNU1razVEaG45WHJMRGNWNGwv?=
 =?gb2312?B?Znc0MFB6V04wamowcUdhbC8zQm84b2JZRHd1WmVDcWN5bTZuS1dJWmFka1FS?=
 =?gb2312?B?UmRFZ1Y3b2g0Rm5rTStBU3J4L05qVitSWnU0WVNMemMxckRjSWtGZERGczd4?=
 =?gb2312?B?Y202d1NHT0tsRFkxaGZ4TStQRy82cUVVMFhhOVJSbVFuUzFtWDhxbHlSM096?=
 =?gb2312?B?Mi9Fb0tnSnNhN1hYV2hnN2lSOGtqZU9wOFJCL3AyZkd6MVJIaFNSZG1NYzBj?=
 =?gb2312?B?WlVENkp6bWhXalZ5b3RlZExUNTZGTmNMbGdQT2JWOTZ0aTkyajRoRVFkRWJx?=
 =?gb2312?B?Vi83aHFWNEhmUEhJMlVNejROYytPK05CbU5TRzBHRlBFMjlNWFVpOEJqR2ZL?=
 =?gb2312?B?c0RLdHg0aU5aWnZPUXVjbHZaNVNOQWJ1cWpYWkJaMFAyeXpaNEtycitqY05C?=
 =?gb2312?B?eTdueU1wZ0RaNm9hQ1JZdVRtdHBNaU41STgvdGVtNnBDd1VzNUwzbUc3SGFV?=
 =?gb2312?B?Z3FtMXM2WVdCbDh5YkJtbVoyUXk4Smx5Mi9FV3NVVGZURitSNE1SZHQ3d04w?=
 =?gb2312?B?Z3h0TU81VGdxelIyZGljVWNVSjcyQ1pnZUdFZW05aGUxWmpVbFVYMzdWZkVh?=
 =?gb2312?B?ckQxQlY4ZmtTM2xmREh0NFh5NU5RTk1paXJPaW55SWdPMlh5VXNIcDBuZjFz?=
 =?gb2312?B?T1lVS2FhdmlIU1Q0NEYzU3Y0SHFSbmUxaVhHWTE0clZqQ0F3eHdUdDJTRFNi?=
 =?gb2312?B?L3hRRWR4RWpRWGprWlMwQ1RjSC9kdm1uSWsvL0Q4aDlnb0pzWkRsdGlLYUlU?=
 =?gb2312?B?R3RwQ29yNHRxbUhWQWN5TGdyeXNFZFRCVWRCVGRST1Uwb1g2MjFwL2VJWXZa?=
 =?gb2312?B?ZGlPdkVLaDkrZ0FVWXgveGV1eXpKNDcrYUVGQlJnUHByQnI2enRsdHJ6YTND?=
 =?gb2312?B?Z1ZEYStVaVBQOGNGNThNVmNkU2ZybUl4ZUhuQktuSFZnemhhL3JSUnBtMW9o?=
 =?gb2312?B?bjhxcDNsUHUyVkhya241Y0NsM2ptM3FzWk0xcTl0aElaOHpqRVQvdUdkaER4?=
 =?gb2312?B?b0xHQ05IV20vWUxrZmZqU2kvTlVBbFd2WUhybmZnSlNvdzBTRk0rdER4NER5?=
 =?gb2312?B?Z2QrRVNTVFA3RS9ucmZ4Zk02VlZrSEZKMzZmN2hsdFdhTGtaY0F6US9HRGE0?=
 =?gb2312?Q?8jUnxjsW8iWLVsOxYWp1L0zf17+cVmN8zxVEIpM?=
x-ms-exchange-transport-forked: True
Content-ID: <0A1BB25F4EFB9A4F8FFCCED55E5DC8FD@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be15ff47-6a55-4f90-5175-08d944dd35cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2021 02:31:52.9992 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v4v/sKoj72mqiWXgf8zdkM3W0n/0Vx8p8S8sB4Xw6mXFlcPLLS/f6VCxm3385ts28TO9RX1GZulkl6xIu+qtcMA2ekcx9Ora7fnh9jIymLU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3678
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] shmget03: fix test when some shm segments already
 exist
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, LTP List <ltp@lists.linux.it>,
 Huanian Li <huanli@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi All
> Hi!
>>>> Yes, good point, that would be more precise for ENOSPC testing.
>>> AFAIK, ltp doesn't support parallel test now. I think parallel test
>>> maybe a future plan that is why we use docparase to collect each case's
>>> used resources(so we can convert many groups, like pid, memory, disk
>>> space..., then we can run pid group and memory groups test case parallelly).
>> Yes, parallel support is not supported atm. Richie and Cyril has done some work
>> on runltp-ng to support it. Yes, first it's needed to add support in resources
>> (docparse), see Cyril's old block post [1].
>
> Besides most of the SHM tests will crash and burn if executed in
> parallel. The SysV IPC shares a global namespace and because of that we
> can't really write tests without assuming that we are the only one
> manipulating them when the test is executed.
I guess we should reach a consensus that how to fix this problem
1)use for loop to trigger this error
2)use CLONE_NEWIPC to trigger this error
3)Or we are the only one that use shm and we can add a api to count the 
existed_cnt

ps: I don't want to leave this problem too long time.

Best Regards
Yang Xu
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
