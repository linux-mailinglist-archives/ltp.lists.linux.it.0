Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C05363B25AF
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Jun 2021 05:46:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 454F13C6FF0
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Jun 2021 05:46:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 15CB03C30EA
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 05:46:49 +0200 (CEST)
Received: from esa2.fujitsucc.c3s2.iphmx.com (esa2.fujitsucc.c3s2.iphmx.com
 [68.232.152.246])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id E7DA760086B
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 05:46:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1624506409; x=1656042409;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=++r+EmjIRTPjvh01wfE6USdsd5BIfKQHDzkkec+L47I=;
 b=ZU3RR/VOl7fOEvyu+M6qTIwICINq8MTJcD0jKQ/tDxZYHk83ErhCrZsA
 ambtWmfvhzQgkiAt1dDvvdfukYpmJDiMvbWvm1yoBRldXZo7N0Q9PLaFH
 CLf4QH9fNUwFIyva0JOZ07HRFSMk7Ls4yItvjteKMNiBLTM7a8oalRE3E
 fsgrVk/60i49ZyBf31anZ+PpxEgXRAwFaxuPMtANyAuFpMUUlbfxBTJ8A
 vFzCX+2+qBq83SaCUl+EIrx+Do66XMjVTMW3tZX8CgtKlw6RnRTEVIfzt
 Ltn/qTW9ULpqCjkvKlXZie4eo8BIl6GiUihB036jq1BTiw9T6hvBeKWac g==;
IronPort-SDR: MYyv+g10mLeFu2DfjnrPPA5JkJ6gJz9X+KM4qxG0tNBrrKuICk+PdkOsmNy8+KepNdrerj0dNZ
 nhTuuB2v4clMzY86XEZAEHrEw04FQfWkw3XVlsDsX0T51+xZCj4BOj+Sj+qJs0qtBCq3YceHOi
 gSFey9dX4f7Rq1gFWKxPqrJy2cxuWVSy4Blt/93iEdZH1uD9YMyCYH0dSlk7F4EfzVbayGPI6O
 nftfghpACWEhFT+fvKu2kxkUqQlc9jsJD9dEOegiU7ARBKxCIpJU0jJArrpC6yIin5WrYFyh+o
 V5g=
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="41870807"
X-IronPort-AV: E=Sophos;i="5.83,295,1616425200"; d="scan'208";a="41870807"
Received: from mail-ty1jpn01lp2059.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.59])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 12:46:46 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LHb3ca0CLMP7PWath/a+F/r9qoy+8JZ6LojpOh005YwLJpDldA1/4e6uYHzHhAgEpSrbODHYnF2fsGsgP9532sRc+8VPiu03JbHeNSm3cGep3X9TF8Jo7ortKfhOUBwAi8K1kzlnbyA2i94nbFzy7PhgMGixfn+06D2cplsrj4vH1b7ssXao5iNFvM8ClyvELBJ/0pfkAvQml4HBYAKEME/2DHBF9e/oyLLF+wYz8KRBvk/KMfal8w+QDMwoYvLwy8X+C2kyz+iPb1G4XIcQY8EZhSWcO6LEYFLMuzHjAegXf7QL/6UrrITnOTj01o3e0hrdCK+EXmMnZgb/L7NdpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=++r+EmjIRTPjvh01wfE6USdsd5BIfKQHDzkkec+L47I=;
 b=eu+jn22DkvGrFptuO6m4IUAvtWNwHlcpozJVZvbFYnxUGA4x4UEDvmodP6fkkKzc191JJPM4Kl0vq9srOjxD/p2m7U4Y5fawl1Ai94NXBsfqV+ViqJNUZC0PBPAM1mmpdImY1ueZGNEQUbGgCaTivXzExdTq6S58j0YLLd+Abcx5hnh/gSWOJOFS0mkd1woftuxEh1JZ46tcnJYRv4QouRIpersvWwgn/6bRy/uPX6+ZkcMDMzFgyjxVMPVk55mWh6+5XmEvoevRZ2Ua0I63OPEegtXJ5y3YJGimMxc4wX5SArW7fhstEmbik6A17INxB32mxmATQ5Wn6ugPMrLbBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=++r+EmjIRTPjvh01wfE6USdsd5BIfKQHDzkkec+L47I=;
 b=k8LoFPa+ii5f9gUFUfaGwpGvyonRA/AcVSBuGoIdGQgOMFpr5m7syeObJBkupLy9AHfyrTnDJkPrHPz4R8dBZLcS9k/88JqxHnDPT1hAEF4kDQOK2WV3rxthnEXfhy+GTTYaB0TMd5TENTt822e8179NG6bf8V+8FlA275BzC8g=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYCPR01MB6126.jpnprd01.prod.outlook.com (2603:1096:400:49::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Thu, 24 Jun
 2021 03:46:42 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::f84c:9ac2:ee90:c6d4]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::f84c:9ac2:ee90:c6d4%9]) with mapi id 15.20.4264.020; Thu, 24 Jun 2021
 03:46:42 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [PATCH v2] syscalls/shmget*: Convert into new api
Thread-Index: AQHXZ0EIYQwBmzCCrk6/ACjTKY/5YKshmtAAgADt8YA=
Date: Thu, 24 Jun 2021 03:46:42 +0000
Message-ID: <60D40047.80801@fujitsu.com>
References: <YMytkmBZb5zDBLGi@yuki>
 <1624350688-31627-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <YNM4rlDJLzb4xk6V@yuki>
In-Reply-To: <YNM4rlDJLzb4xk6V@yuki>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [223.111.68.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 507e49ff-c696-4408-7ff0-08d936c2ae60
x-ms-traffictypediagnostic: TYCPR01MB6126:
x-microsoft-antispam-prvs: <TYCPR01MB61269B9CDA22BA893C92E1EBFD079@TYCPR01MB6126.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1227;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ewSlvO024YBBHt0gHG2Wre89pug1+vzNUPlbgy5u4S1zq8gctwCkl/PuWEsyvsucklVllONkoZoq3+fd0WsBl9Cp2Nqk7+yZn9ZCcI37IpJkz5DtmHm043Eu13/KKBDCCXUQwG5BCfCOZDs7gc9UVHQZ55dsc+SEURug9VpybTb7d3LOl18zzzPVIQB5p6V8Bdn0L8xthmAH/19JQae2NEWZOo6T1z6DaMMPp8Bbz9BVYUlpMMSt7gf9UV8uMu+EuppdMpyVKci2Ah+2+DUYkoXzl3GdGSTVBT66NxDLOVPSxV0/+/us9/4kzcrZRr3Rpi85ZriEs/rCIT0fxlYkLGwtxXF6kuZwmBDIdqB+Lh2FMsKN3m8hMoYLvGLPuigcUANPckrdWfLdeXZ2UgM7LfShGihxLhxKCSacV4MKPIiQIW1FZnNg3o3aVIbOpTV/Q60qYib6FN48Sl2xi7JkxXMh7R9od4RLKi80q4kMzrHMrMegx+e6V7vLIKPf11wRkQObKCqpCFNxYPljjonGG55PI+xjg1vRmr9fy0OflWv8bZDMeRb0uelHEJndYnpvuGfRCsQUrwWf1uYA4bL0LRjbcuycOgNS75RNNESdRzDNtAozWXEoN9NNY3fh+MXsvvgssCzw6V8taQQ/ErW2RTYe/nK66Iu6DzbuT/lS1t5U2qrl4cFNC1XyJEMhElFIqiY570U8Klk15dGUI0UmKQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39860400002)(366004)(346002)(376002)(66476007)(66556008)(64756008)(66446008)(66946007)(186003)(91956017)(76116006)(478600001)(6486002)(2906002)(30864003)(83380400001)(86362001)(26005)(33656002)(2616005)(85182001)(38100700002)(8676002)(122000001)(4326008)(316002)(6512007)(5660300002)(6506007)(71200400001)(6916009)(36756003)(8936002)(2004002)(579004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?WnZUeUdVUGlBOFgvejNBcW9KdWEwMldYSW5rM1BoMC9Tc0pGOC9vall2UG8x?=
 =?gb2312?B?MjJUMkVaSHZGRm1iOGdTMVBOclNTY1RzUmdHQkZNa1R4eUdjaFdzSGZmRENH?=
 =?gb2312?B?emlXSm0rZ2dmdTd2ZmJIdTMrd3FVNzlaSjZRTTU3SUFXVzY2emQ3Z2NzL2pC?=
 =?gb2312?B?SEtGdVN4UnkxWTMxbXNacGV4aTNyc0FBT2VDaDlqcmwzSEJPbGYvcEd5VWsw?=
 =?gb2312?B?dDdUWXJSVU5KbnVac0JQRzdVS3JPODhsSWdrUEo1dHkvS2ovUG4yWWJCOXV1?=
 =?gb2312?B?cDRaSER0SWU2eFJZK0lRRXlPazBWdU9FNFN2WlJ6cHFSRFQrdlgzRnQwUEIv?=
 =?gb2312?B?ampuWG5KM0Z4OFhPWkxCWHhsVy92Sjk2LzhSWEwrYlJ3NDhwSUFVN2M5N1BY?=
 =?gb2312?B?eDRWTEdveFVvdlZJYldPQ1BDTnpQKzNGNStIZnN4UzVIbHBacyt4YTlTUjMy?=
 =?gb2312?B?ZEFzekFDSWUycXpaVGRUWURhTkVENTBldndDUDNRRDY1Uk5BU1J5VGRWWnhu?=
 =?gb2312?B?ajZEa2ZoZGVpOXZyakx0aXdpODZsNXVzdFRLSzc5R3BhcEd5SkNQNjVicWlW?=
 =?gb2312?B?a3FqQS96NUxxMktOKy9jYmdJTGROZWlqWDRjQlB6b1dQcVdCMEZoYnB6TWwv?=
 =?gb2312?B?Z1N4ZkVxZFZINjZIZjZKVll0Qi80UWpXT1N1QkVaRUs2ZmRlK2l5SzRndHlY?=
 =?gb2312?B?Y1FBb3dTbm8vTGExRmlsUS9GNGJWQ20zd0NrZXU1VDJXemNzRUU4R2N3aHpB?=
 =?gb2312?B?VGlkdXNaaU8xVFNxNFkvUUxvVStjOGorKzh3cy93ZzBITW9ZMzE2RTNTYW0v?=
 =?gb2312?B?MHh3MEJzSzM0aHZBWkFVYm9lZzZVWkdFSyt6SENzTW5neWNuWWQ5dlBueVNS?=
 =?gb2312?B?OG1LcDNzeW5UY1Jac2gvNzI0WjBWanI3bkFaQm1UcXRKRnJ5QWp1R2w1cDln?=
 =?gb2312?B?MDlRSFRCblhLcUc3RmowK1Z5Tkh4TjlKRXZCVXdhTGtzb05oTUZxZGNBdEM2?=
 =?gb2312?B?NEtqby9ndkhEY2FpSGZiaHNHSXNLcmNoUnRacFhtVVlSZ01RaXcwM05mQk4w?=
 =?gb2312?B?TVBpbVIwNjI0RUJ3VC85bTdvaHlsby9zM2duRXRtcmtPWW1MZThFNFl2WnFZ?=
 =?gb2312?B?TkZaT1hsVVRTczNwekd2alNXd2orazl2NVFPbmwzT1hLaE9kT1dMRmppRVdy?=
 =?gb2312?B?bFpNU3FJK2lOYW5jdVVqb0xMQTVyeXMzM3ltRnJaOFlZZnFndEhmeUM1akph?=
 =?gb2312?B?MGU2UDAzTzN4QzgxRzNZRlU5bGl2WDNDQ0FVSzZyT1lEVlArbWljRUhoMk4r?=
 =?gb2312?B?ZnA2a0l1MTk2bTRQU0c4S3k1YWR3STU1dmdITFJtRjN5N3cwbzRkams1eVFj?=
 =?gb2312?B?QzZwem1qK0lJRURrWjBMUFJaTGhYTkh6MkpzN3JGbC9CWjBQa2V2TGZhYUxT?=
 =?gb2312?B?V05nVFF0RjYrZFBNNXpUWTNoQWZ6bHU5Tm42OUZ5S1IwMWRVU3ZVdGx3SWFw?=
 =?gb2312?B?amNkSi9qbUpDWUl4WndjcWFZQUwxa250bFJ2R09ubmlxbGFRMW5ONW9tenpz?=
 =?gb2312?B?SE41b0hxeEN5SFgwWW5KZ2NJNC9RbWFwTWdMQVZHMGNPL1lWMmREcFNkK2FD?=
 =?gb2312?B?SmhIOEI0bGpodm54Ym9mbFg3RzVSLy9JYkszcHlIR3NHZVM3enB3UlBVZXRo?=
 =?gb2312?B?cVl2akNYYi9EbitwZjU3QWJ6a3N1RDVUalZQQy9DcmEzbjI3dFBIV1gvdWly?=
 =?gb2312?Q?CfC5j2UUJVQl0uXIXuzhg2DGC3mA87NwDytDx9z?=
x-ms-exchange-transport-forked: True
Content-ID: <36674C10FA454F4B8A3A2A2D47C68D8C@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 507e49ff-c696-4408-7ff0-08d936c2ae60
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2021 03:46:42.6014 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wniXEdi0cApmgCWgfSUqhYasJZ/6lx0mS7VTWil0GfFket/O50fjkrVdEOzRBg4KIr/By+g66Acl9p3DxF11zdJgBfSojQMZPNP7qVKD/dY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6126
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/shmget*: Convert into new api
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

Hi Cyril
> Hi!
>> +
>> +static struct tcase {
>> +	int *shmkey;
>> +	size_t size;
>>   	int flags;
>> -	int error;
>> -} TC[] = {
>> -	/* EINVAL - size is 0 */
>> -	{
>> -	&shmkey2, 0, IPC_CREAT | IPC_EXCL | SHM_RW, EINVAL},
>> -	    /* EINVAL - size is negative */
>> -//      {&shmkey2, -1, IPC_CREAT | IPC_EXCL | SHM_RW, EINVAL},
>> -	    /* EINVAL - size is larger than created segment */
>> -	{
>> -	&shmkey, SHM_SIZE * 2, SHM_RW, EINVAL},
>> -	    /* EEXIST - the segment exists and IPC_CREAT | IPC_EXCL is given */
>> -	{
>> -	&shmkey, SHM_SIZE, IPC_CREAT | IPC_EXCL | SHM_RW, EEXIST},
>> -	    /* ENOENT - no segment exists for the key and IPC_CREAT is not given */
>> -	    /* use shm_id_2 (-1) as the key */
>> -	{
>> -	&shm_nonexisting_key, SHM_SIZE, SHM_RW, ENOENT}
>> +	/*1: nobody expected  0: root expected */
>> +	int exp_user;
>> +	int exp_err;
>> +} tcases[] = {
>> +	{&shmkey1, SHM_SIZE, IPC_EXCL, 0, ENOENT},
>> +	{&shmkey, SHM_SIZE, IPC_CREAT | IPC_EXCL, 0, EEXIST},
>> +	{&shmkey1, SHMMIN - 1, IPC_CREAT | IPC_EXCL, 0, EINVAL},
>> +	{&shmkey1, SHMMAX + 1, IPC_CREAT | IPC_EXCL, 0, EINVAL},
>> +	{&shmkey, SHM_SIZE * 2, IPC_EXCL, 0, EINVAL},
>> +	{&shmkey, SHM_SIZE, SHM_RD, 1, EACCES},
>> +	{&shmkey1, SHM_SIZE, IPC_CREAT | SHM_HUGETLB, 1, EPERM}
>
> This case is a bit more complicated, on my test machine with
> nr_hugepages == 0 I get ENOMEM, since there are no hugepages allocated
> in the pool.
>
> When I add .request_hugepages = 1, the the tst_test structure, the
> hugepage pool size is increased by the test library and this request
> succeds and creates a SHM segment. See description below on how this has
> to be fixed.
>
>>   };
>>
>> -int main(int ac, char **av)
>> +static void do_test(unsigned int n)
>>   {
>> -	int lc;
>> -	int i;
>> -
>> -	tst_parse_opts(ac, av, NULL, NULL);
>> -
>> -	setup();		/* global setup */
>> -
>> -	/* The following loop checks looping state if -i option given */
>> -
>> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
>> -		/* reset tst_count in case we are looping */
>> -		tst_count = 0;
>> +	struct tcase *tc =&tcases[n];
>> +	pid_t pid;
>>
>> -		/* loop through the test cases */
>> -		for (i = 0; i<  TST_TOTAL; i++) {
>> -			/*
>> -			 * Look for a failure ...
>> -			 */
>> -
>> -			TEST(shmget(*(TC[i].skey), TC[i].size, TC[i].flags));
>> -
>> -			if (TEST_RETURN != -1) {
>> -				tst_resm(TFAIL, "call succeeded unexpectedly");
>> -				continue;
>> -			}
>> -
>> -			if (TEST_ERRNO == TC[i].error) {
>> -				tst_resm(TPASS, "expected failure - errno = "
>> -					 "%d : %s", TEST_ERRNO,
>> -					 strerror(TEST_ERRNO));
>> -			} else {
>> -				tst_resm(TFAIL, "call failed with an "
>> -					 "unexpected error - %d : %s",
>> -					 TEST_ERRNO, strerror(TEST_ERRNO));
>> -			}
>> -		}
>> +	if (tc->exp_user == 0) {
>> +		TST_EXP_FAIL(shmget(*tc->shmkey, tc->size, tc->flags), tc->exp_err,
>> +			"shmget(%i, %lu, %i)", *tc->shmkey, tc->size, tc->flags);
>> +		return;
>>   	}
>>
>> -	cleanup();
>> -
>> -	tst_exit();
>> +	pid = SAFE_FORK();
>> +	if (pid == 0) {
>> +		SAFE_SETUID(pw->pw_uid);
>> +		TST_EXP_FAIL(shmget(*tc->shmkey, tc->size, tc->flags), tc->exp_err,
>> +			"shmget(%i, %lu, %i)", *tc->shmkey, tc->size, tc->flags);
>> +		exit(0);
>> +	}
>> +	tst_reap_children();
>>   }
>>
>> -/*
>> - * setup() - performs all the ONE TIME setup for this test.
>> - */
>> -void setup(void)
>> +static void setup(void)
>>   {
>> +	shmkey = GETIPCKEY();
>> +	shmkey1 = GETIPCKEY();
>>
>> -	tst_sig(NOFORK, DEF_HANDLER, cleanup);
>> -
>> -	TEST_PAUSE;
>> -
>> -	/*
>> -	 * Create a temporary directory and cd into it.
>> -	 * This helps to ensure that a unique msgkey is created.
>> -	 * See libs/libltpipc/libipc.c for more information.
>> -	 */
>> -	tst_tmpdir();
>> -
>> -	/* get an IPC resource key */
>> -	shmkey = getipckey();
>> -
>> -	/* Get an new IPC resource key. */
>> -	shmkey2 = getipckey();
>> -
>> -	if ((shm_id_1 = shmget(shmkey, SHM_SIZE, IPC_CREAT | IPC_EXCL |
>> -			       SHM_RW)) == -1) {
>> -		tst_brkm(TBROK, cleanup, "couldn't create shared memory "
>> -			 "segment in setup()");
>> -	}
>> -
>> -	/* Make sure shm_nonexisting_key is a nonexisting key */
>> -	while (1) {
>> -		while (-1 != shmget(shm_nonexisting_key, 1, SHM_RD)) {
>> -			shm_nonexisting_key--;
>> -		}
>> -		if (errno == ENOENT)
>> -			break;
>> -	}
>> +	SAFE_FILE_PRINTF("/proc/sys/vm/hugetlb_shm_group", "1");
>
> There is no need to change the default hugetlb group, all that has to be
> done is to strip the user of all groups as well as there is absolutely
> no guarantee that group 1 will not be in the list of supplementary
> groups for a root users.
>
> So when we change uid we as well have to do:
>
> 	setgroups(0, NULL);
> 	SAFE_SETGID(pw->pw_gid);
> 	SAFE_SETUID(pw->pw_uid);
>
> This will strip the process of all additional permissions that may have
> been passed down by the process running under root.
>
> Also ideally we should add SAFE_SETGROUPS() to the test library in a
> separate patch so that we can make use of it here.
>
Yes, your are right. my origial way is to set 1 and it doesn't work on 
your envrionment, so it doesn't meet EPERM error and meet the ENOMEM 
error in kernel hugetlb_file_setup function.

I have check the kernel code, it used  in_group_p function to check 
whether have read access. So using setgroups(0, NULL) is right. Thanks.

Also, I add a ENOMEM test error test.
>> +	shm_id = SAFE_SHMGET(shmkey, SHM_SIZE, IPC_CREAT | IPC_EXCL);
>> +	pw = SAFE_GETPWNAM("nobody");
>>   }
>>
>> -/*
>> - * cleanup() - performs all the ONE TIME cleanup for this test at completion
>> - * 	       or premature exit.
>> - */
>> -void cleanup(void)
>> +static void cleanup(void)
>>   {
>> -	/* if it exists, remove the shared memory resource */
>> -	rm_shm(shm_id_1);
>> -
>> -	tst_rmdir();
>> -
>> +	if (shm_id>= 0)
>> +		SAFE_SHMCTL(shm_id, IPC_RMID, NULL);
>>   }
>> +
>> +static struct tst_test test = {
>> +	.needs_tmpdir = 1,
>> +	.needs_root = 1,
>> +	.forks_child = 1,
>> +	.setup = setup,
>> +	.cleanup = cleanup,
>> +	.test = do_test,
>> +	.tcnt = ARRAY_SIZE(tcases),
>> +	.save_restore = (const char * const[]) {
>> +		"?/proc/sys/vm/hugetlb_shm_group",
>> +		NULL,
>> +	}
>> +};
>> diff --git a/testcases/kernel/syscalls/ipc/shmget/shmget03.c b/testcases/kernel/syscalls/ipc/shmget/shmget03.c
>> index 96ebf3608..d2e850b2a 100644
>> --- a/testcases/kernel/syscalls/ipc/shmget/shmget03.c
>> +++ b/testcases/kernel/syscalls/ipc/shmget/shmget03.c
>> @@ -1,171 +1,75 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>   /*
>> - *
>> - *   Copyright (c) International Business Machines  Corp., 2001
>> - *
>> - *   This program is free software;  you can redistribute it and/or modify
>> - *   it under the terms of the GNU General Public License as published by
>> - *   the Free Software Foundation; either version 2 of the License, or
>> - *   (at your option) any later version.
>> - *
>> - *   This program is distributed in the hope that it will be useful,
>> - *   but WITHOUT ANY WARRANTY;  without even the implied warranty of
>> - *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
>> - *   the GNU General Public License for more details.
>> - *
>> - *   You should have received a copy of the GNU General Public License
>> - *   along with this program;  if not, write to the Free Software
>> - *   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
>> + * Copyright (c) International Business Machines  Corp., 2001
>> + *  03/2001 - Written by Wayne Boyer
>>    */
>>
>> -/*
>> - * NAME
>> - *	shmget03.c
>> +/*\
>> + * [Description]
>>    *
>> - * DESCRIPTION
>> - *	shmget03 - test for ENOSPC error
>> + * Test for ENOSPC error.
>>    *
>> - * ALGORITHM
>> - *	create shared memory segments in a loop until reaching the system limit
>> - *	loop if that option was specified
>> - *	  attempt to create yet another shared memory segment
>> - *	  check the errno value
>> - *	    issue a PASS message if we get ENOSPC
>> - *	  otherwise, the tests fails
>> - *	    issue a FAIL message
>> - *	call cleanup
>> - *
>> - * USAGE:<for command-line>
>> - *  shmget03 [-c n] [-e] [-i n] [-I x] [-P x] [-t]
>> - *     where,  -c n : Run n copies concurrently.
>> - *             -e   : Turn on errno logging.
>> - *	       -i n : Execute test n times.
>> - *	       -I x : Execute test for x seconds.
>> - *	       -P x : Pause for x seconds between iterations.
>> - *	       -t   : Turn on syscall timing.
>> - *
>> - * HISTORY
>> - *	03/2001 - Written by Wayne Boyer
>> - *
>> - * RESTRICTIONS
>> - *	none
>> + * ENOSPC -  All possible shared memory segments have been taken (SHMMNI).
>>    */
>> -
>> -#include "ipcshm.h"
>> -
>> -char *TCID = "shmget03";
>> -int TST_TOTAL = 1;
>> -
>> -/*
>> - * The MAXIDS value is somewhat arbitrary and may need to be increased
>> - * depending on the system being tested.
>> - */
>> -#define MAXIDS	8192
>> -
>> -int shm_id_1 = -1;
>> -int num_shms = 0;
>> -
>> -int shm_id_arr[MAXIDS];
>> -
>> -int main(int ac, char **av)
>> +#include<errno.h>
>> +#include<sys/types.h>
>> +#include<sys/ipc.h>
>> +#include<stdlib.h>
>> +#include<pwd.h>
>> +#include<sys/shm.h>
>> +#include "tst_test.h"
>> +#include "tst_safe_sysv_ipc.h"
>> +#include "libnewipc.h"
>> +
>> +static int *queues;
>> +static int maxshms;
>> +static key_t shmkey;
>> +
>> +static void verify_shmget(void)
>>   {
>> -	int lc;
>> -
>> -	tst_parse_opts(ac, av, NULL, NULL);
>> -
>> -	setup();		/* global setup */
>> -
>> -	/* The following loop checks looping state if -i option given */
>> -
>> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
>> -		/* reset tst_count in case we are looping */
>> -		tst_count = 0;
>> -
>> -		/*
>> -		 * use the TEST() macro to make the call
>> -		 */
>> -
>> -		TEST(shmget(IPC_PRIVATE, SHM_SIZE, IPC_CREAT | IPC_EXCL
>> -			    | SHM_RW));
>> -
>> -		if (TEST_RETURN != -1) {
>> -			tst_resm(TFAIL, "call succeeded when error expected");
>> -			continue;
>> -		}
>> -
>> -		switch (TEST_ERRNO) {
>> -		case ENOSPC:
>> -			tst_resm(TPASS, "expected failure - errno = "
>> -				 "%d : %s", TEST_ERRNO, strerror(TEST_ERRNO));
>> -			break;
>> -		default:
>> -			tst_resm(TFAIL, "call failed with an "
>> -				 "unexpected error - %d : %s",
>> -				 TEST_ERRNO, strerror(TEST_ERRNO));
>> -			break;
>> -		}
>> -	}
>> -
>> -	cleanup();
>> -
>> -	tst_exit();
>> +	TST_EXP_FAIL(shmget(shmkey + maxshms, SHM_SIZE, IPC_CREAT | IPC_EXCL | SHM_RW), ENOSPC,
>> +		"shmget(%i, %i, %i)", shmkey + maxshms, SHM_SIZE, IPC_CREAT | IPC_EXCL | SHM_RW);
>>   }
>>
>> -/*
>> - * setup() - performs all the ONE TIME setup for this test.
>> - */
>> -void setup(void)
>> +static void setup(void)
>>   {
>> +	int res, num;
>>
>> -	tst_sig(NOFORK, DEF_HANDLER, cleanup);
>> +	shmkey = GETIPCKEY();
>>
>> -	TEST_PAUSE;
>> +	SAFE_FILE_SCANF("/proc/sys/kernel/shmmni", "%i",&maxshms);
>>
>> -	/*
>> -	 * Create a temporary directory and cd into it.
>> -	 * This helps to ensure that a unique msgkey is created.
>> -	 * See libs/libltpipc/libipc.c for more information.
>> -	 */
>> -	tst_tmpdir();
>> -
>> -	/* get an IPC resource key */
>> -	shmkey = getipckey();
>> -
>> -	/*
>> -	 * Use a while loop to create the maximum number of memory segments.
>> -	 * If the loop exceeds MAXIDS, then break the test and cleanup.
>> -	 */
>> -	while ((shm_id_1 = shmget(IPC_PRIVATE, SHM_SIZE, IPC_CREAT |
>> -				  IPC_EXCL | SHM_RW)) != -1) {
>> -		shm_id_arr[num_shms++] = shm_id_1;
>> -		if (num_shms == MAXIDS) {
>> -			tst_brkm(TBROK, cleanup, "The maximum number of shared "
>> -				 "memory ID's has been\n\t reached.  Please "
>> -				 "increase the MAXIDS value in the test.");
>> -		}
>> -	}
>> -
>> -	/*
>> -	 * If the errno is other than ENOSPC, then something else is wrong.
>> -	 */
>> -	if (errno != ENOSPC) {
>> -		tst_resm(TINFO, "errno = %d : %s", errno, strerror(errno));
>> -		tst_brkm(TBROK, cleanup, "Didn't get ENOSPC in test setup");
>> +	queues = SAFE_MALLOC(maxshms * sizeof(int));
>> +	for (num = 0; num<  maxshms; num++) {
>> +		queues[num] = -1;
>> +		res = shmget(shmkey + num, SHM_SIZE, IPC_CREAT | IPC_EXCL | SHM_RW);
>> +		if (res != -1)
>> +			queues[num] = res;
>> +		else
>> +			tst_brk(TBROK | TERRNO, "shmget failed unexpectedly");
>>   	}
>> +	tst_res(TINFO, "The maximum number of memory segments (%d) has been reached",
>> +		maxshms);
>>   }
>>
>> -/*
>> - * cleanup() - performs all the ONE TIME cleanup for this test at completion
>> - * 	       or premature exit.
>> - */
>> -void cleanup(void)
>> +static void cleanup(void)
>>   {
>> -	int i;
>> +	int num;
>>
>> -	/* remove the shared memory resources that were created */
>> -	for (i = 0; i<  num_shms; i++) {
>> -		rm_shm(shm_id_arr[i]);
>> -	}
>> +	if (!queues)
>> +		return;
>>
>> -	tst_rmdir();
>> +	for (num = 0; num<  maxshms; num++) {
>> +		if (queues[num] != -1)
>> +			SAFE_SHMCTL(queues[num], IPC_RMID, NULL);
>> +	}
>
> This is still not correct, we will pass random data to the SAFE_SHMCTL()
> in a case shmget() had failed before the loop in setup reached maximal value.
>
> We have to maintain a global variable with the number of the ids in the
> queues[] array and only remove these that have been created.
Yes, I have added a global count.

Best Regards
Yang Xu
>
> 	for (i = 0; i<  maxshms; i++) {
> 		res = shmget(...);
>
> 		if (res == -1)
> 			tst_brk(TBROK...);
>
> 		queues[queue_cnt++] = res;
> 	}
>
>
>
> 	for (i = 0; i<  queue_cnt; i++)
> 		SAFE_SHMCTL(queues[i], IPC_RMID);
>
>> +	free(queues);
>>   }

>> +
>> +static struct tst_test test = {
>> +	.needs_tmpdir = 1,
>> +	.setup = setup,
>> +	.cleanup = cleanup,
>> +	.test_all = verify_shmget,
>> +};
>> diff --git a/testcases/kernel/syscalls/ipc/shmget/shmget04.c b/testcases/kernel/syscalls/ipc/shmget/shmget04.c
>> index 60a263c77..d92dfe635 100644
>> --- a/testcases/kernel/syscalls/ipc/shmget/shmget04.c
>> +++ b/testcases/kernel/syscalls/ipc/shmget/shmget04.c
>> @@ -1,153 +1,71 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>   /*
>> - *
>> - *   Copyright (c) International Business Machines  Corp., 2001
>> - *
>> - *   This program is free software;  you can redistribute it and/or modify
>> - *   it under the terms of the GNU General Public License as published by
>> - *   the Free Software Foundation; either version 2 of the License, or
>> - *   (at your option) any later version.
>> - *
>> - *   This program is distributed in the hope that it will be useful,
>> - *   but WITHOUT ANY WARRANTY;  without even the implied warranty of
>> - *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
>> - *   the GNU General Public License for more details.
>> - *
>> - *   You should have received a copy of the GNU General Public License
>> - *   along with this program;  if not, write to the Free Software
>> - *   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
>> + * Copyright (c) International Business Machines  Corp., 2001
>> + *  03/2001 - Written by Wayne Boyer
>>    */
>>
>> -/*
>> - * NAME
>> - *	shmget04.c
>> - *
>> - * DESCRIPTION
>> - *	shmget04 - test for EACCES error
>> - *
>> - * ALGORITHM
>> - *	create a shared memory segment without read or write permissions
>> - *	loop if that option was specified
>> - *	  call shmget() with SHM_RW flag using TEST() macro
>> - *	  check the errno value
>> - *	    issue a PASS message if we get EACCES
>> - *	  otherwise, the tests fails
>> - *	    issue a FAIL message
>> - *	call cleanup
>> - *
>> - * USAGE:<for command-line>
>> - *  shmget04 [-c n] [-e] [-i n] [-I x] [-P x] [-t]
>> - *     where,  -c n : Run n copies concurrently.
>> - *             -e   : Turn on errno logging.
>> - *	       -i n : Execute test n times.
>> - *	       -I x : Execute test for x seconds.
>> - *	       -P x : Pause for x seconds between iterations.
>> - *	       -t   : Turn on syscall timing.
>> +/*\
>> + * [Description]
>>    *
>> - * HISTORY
>> - *	03/2001 - Written by Wayne Boyer
>> + * Test for EACCES error.
>>    *
>> - * RESTRICTIONS
>> - *	none
>> + * Create a shared memory segment without read or write permissions under
>> + * unpriviledged user and call shmget() with SHM_RD/SHM_WR/SHM_RW flag to
>> + * trigger EACCES error.
>>    */
>> +#include<errno.h>
>> +#include<sys/types.h>
>> +#include<sys/ipc.h>
>> +#include<stdlib.h>
>>   #include<pwd.h>
>> -#include "ipcshm.h"
>> -
>> -char *TCID = "shmget04";
>> -int TST_TOTAL = 1;
>> -
>> -char nobody_uid[] = "nobody";
>> -struct passwd *ltpuser;
>> -
>> -int shm_id_1 = -1;
>> -
>> -int main(int ac, char **av)
>> +#include<sys/shm.h>
>> +#include "tst_safe_sysv_ipc.h"
>> +#include "tst_test.h"
>> +#include "libnewipc.h"
>> +#include "lapi/shm.h"
>> +
>> +static int shm_id = -1;
>> +static key_t shmkey;
>> +static struct tcase {
>> +	char *message;
>> +	int flag;
>> +} tcases[] = {
>> +	{"Testing SHM_RD flag", SHM_RD},
>> +	{"Testing SHM_WR flag", SHM_WR},
>> +	{"Testing SHM_RW flag", SHM_RW},
>> +};
>> +
>> +static void verify_shmget(unsigned int n)
>>   {
>> -	int lc;
>> -
>> -	tst_parse_opts(ac, av, NULL, NULL);
>> -
>> -	setup();		/* global setup */
>> -
>> -	/* The following loop checks looping state if -i option given */
>> -
>> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
>> -		/* reset tst_count in case we are looping */
>> -		tst_count = 0;
>> +	struct tcase *tc =&tcases[n];
>>
>> -		/*
>> -		 * use the TEST() macro to make the call
>> -		 */
>> -
>> -		TEST(shmget(shmkey, SHM_SIZE, SHM_RW));
>> -
>> -		if (TEST_RETURN != -1) {
>> -			tst_resm(TFAIL, "call succeeded when error expected");
>> -			continue;
>> -		}
>> -
>> -		switch (TEST_ERRNO) {
>> -		case EACCES:
>> -			tst_resm(TPASS, "expected failure - errno = "
>> -				 "%d : %s", TEST_ERRNO, strerror(TEST_ERRNO));
>> -			break;
>> -		default:
>> -			tst_resm(TFAIL, "call failed with an "
>> -				 "unexpected error - %d : %s",
>> -				 TEST_ERRNO, strerror(TEST_ERRNO));
>> -			break;
>> -		}
>> -	}
>> -
>> -	cleanup();
>> -
>> -	tst_exit();
>> +	tst_res(TINFO, "%s", tc->message);
>> +	TST_EXP_FAIL(shmget(shmkey, SHM_SIZE, tc->flag), EACCES, "shmget(%i, %i, %i)",
>> +		shmkey, SHM_SIZE, tc->flag);
>>   }
>>
>> -/*
>> - * setup() - performs all the ONE TIME setup for this test.
>> - */
>> -void setup(void)
>> +static void setup(void)
>>   {
>> -	tst_require_root();
>> -
>> -	tst_sig(NOFORK, DEF_HANDLER, cleanup);
>> +	struct passwd *pw;
>>
>> -	TEST_PAUSE;
>> +	pw = SAFE_GETPWNAM("nobody");
>> +	SAFE_SETUID(pw->pw_uid);
>> +	shmkey = GETIPCKEY();
>>
>> -	/* Switch to nobody user for correct error code collection */
>> -	ltpuser = getpwnam(nobody_uid);
>> -	if (setuid(ltpuser->pw_uid) == -1) {
>> -		tst_resm(TINFO, "setuid failed to "
>> -			 "to set the effective uid to %d", ltpuser->pw_uid);
>> -		perror("setuid");
>> -	}
>> -
>> -	/*
>> -	 * Create a temporary directory and cd into it.
>> -	 * This helps to ensure that a unique msgkey is created.
>> -	 * See libs/libltpipc/libipc.c for more information.
>> -	 */
>> -	tst_tmpdir();
>> -
>> -	/* get an IPC resource key */
>> -	shmkey = getipckey();
>> -
>> -	/* create a shared memory segment without read or access permissions */
>> -	if ((shm_id_1 = shmget(shmkey, SHM_SIZE, IPC_CREAT | IPC_EXCL)) == -1) {
>> -		tst_brkm(TBROK, cleanup, "Failed to create shared memory "
>> -			 "segment in setup");
>> -	}
>> +	shm_id = SAFE_SHMGET(shmkey, SHM_SIZE, IPC_CREAT | IPC_EXCL);
>>   }
>>
>> -/*
>> - * cleanup() - performs all the ONE TIME cleanup for this test at completion
>> - * 	       or premature exit.
>> - */
>> -void cleanup(void)
>> +static void cleanup(void)
>>   {
>> -	/* if it exists, remove the shared memory resource */
>> -	rm_shm(shm_id_1);
>> -
>> -	tst_rmdir();
>> -
>> +	if (shm_id>= 0)
>> +		SAFE_SHMCTL(shm_id, IPC_RMID, NULL);
>>   }
>> +
>> +static struct tst_test test = {
>> +	.needs_tmpdir = 1,
>> +	.needs_root = 1,
>> +	.setup = setup,
>> +	.cleanup = cleanup,
>> +	.test = verify_shmget,
>> +	.tcnt = ARRAY_SIZE(tcases),
>> +};
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
