Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF19357A01
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Apr 2021 04:03:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 07FB13C80C7
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Apr 2021 04:03:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B5A3A3C1DDD
 for <ltp@lists.linux.it>; Thu,  8 Apr 2021 04:03:01 +0200 (CEST)
Received: from esa15.fujitsucc.c3s2.iphmx.com (esa15.fujitsucc.c3s2.iphmx.com
 [68.232.156.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E18ED200CF1
 for <ltp@lists.linux.it>; Thu,  8 Apr 2021 04:02:59 +0200 (CEST)
IronPort-SDR: vLrsElAqHiKnqHP5ZfuuIutaU1V2a6vzxKccOh1xAZC7udfBPgYqkSQCJvnuOV+t54a+70T7kD
 NwxJRQrQ5VCW/VFkJHq0p4hAswhLtiA7j19LannEQNke7+Vl5AZbCm3W0KzB/CSouyFzrrFFeh
 8mv3ffhtMDPMuT54uOWDylryNUgnC73I/37e/XgNR0M5rl7/ddYwd0ZSyd7rXqBxu0Y8IKZ1In
 T1zqat5vjgnu9OyWUYDZ6bXoPUHtfObiMEPoOiuvbuLLgMUJOhllpjFfG1iPjbFSBkuDWe3RIl
 u5Q=
X-IronPort-AV: E=McAfee;i="6000,8403,9947"; a="29135424"
X-IronPort-AV: E=Sophos;i="5.82,205,1613401200"; d="scan'208";a="29135424"
Received: from mail-ty1jpn01lp2050.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.50])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2021 11:02:56 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jiSpgBRmS0mLMZEGRK5YN/ZqMjSsEiZc1W8H4dnr8Uv2rDLEkd7Y/txSbhkFdPaBFA9qO7kmELtrCR66S4pGI/DluqklgkWY+qaNpZAx87ehvIuRKNd4+wj5MluwBt+FSIEgkuH5cUPtnMbzhJdkYo6aSSTMubP+/Iz9zaFIdae6jttI8GvDZzDDm/1qnuBM7S1zGxs7tFUzIMgoqkqzpLJVJltiGWspRjWhQQZJzyfPd2z0paMoo6AsLrg1hI7EPljecbNzj/0MXCQFIyzPVWK2VIp33E0jyiAukAhUvAFU4HReBTJGuCka9480ym23mcSF40LeTCMNGmOow8QJ9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FRUNYaSdVkrwvabtjleoqh62TfamVTN1Uj8tEmxWdcg=;
 b=AUZEGeTjaTr4/yAD1fVlL2BgyKJlMY5LA0I5VEvOLVEHaETMef6LlmuVjxDvZFMn2D5OMChsJgXBvwnqjvU4vCBnHQckYiPy5INKwnz/ot1oX4n3DYc99EnlTNW2/7q+uyrtpGoG5D5gy3B44+pC6v2JEEavgTDJ0ZWIWsnMo7Er30RLZ4zAQ/esfsLJSol9zL8pLKuCj0RbjZYrl6yWwX+mOMvOEtNW/EwQy80dZm+78aRcvt1HBaYiCsmYhMF4YgNUfuhYa0INE48VtuBO8qky4XhdBL2DEkmaL9EmBwQaVyZevAtnGk+w8qM+XBvNXe1O+O9RXp1UqWy474UtAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FRUNYaSdVkrwvabtjleoqh62TfamVTN1Uj8tEmxWdcg=;
 b=Egsf/erQRDvVskan7MLKjD7qb3/OdIzw4TMtKheHoLa5JSLIHUua5Oao9VlDtc4uUz5HPcxY7m95AmBsWwc8RydR6lqwaxrl53NfgWYnJDM5590ZMseX4OYh+konwBWgN8HqfnXNKaj+WnLPWu1EgooPkapL3PstGwzIBYIcAbU=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYAPR01MB5151.jpnprd01.prod.outlook.com (2603:1096:404:11f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Thu, 8 Apr
 2021 02:02:53 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::9095:8cd8:6e30:3052]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::9095:8cd8:6e30:3052%5]) with mapi id 15.20.4020.018; Thu, 8 Apr 2021
 02:02:53 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Thread-Topic: [LTP] [PATCH 3/3] syscalls/semctl01: Convert into new api
Thread-Index: AQHXH9Ndhz7aaDhWMkm01hZD+qhM2qqpaIEAgACfOgA=
Date: Thu, 8 Apr 2021 02:02:53 +0000
Message-ID: <606E7268.8000603@fujitsu.com>
References: <1616497037-19158-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1616497037-19158-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <46e7a46a-f3d2-078d-1126-5a8679cea7be@oracle.com>
In-Reply-To: <46e7a46a-f3d2-078d-1126-5a8679cea7be@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [180.96.28.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fcc7415b-4317-4e76-e560-08d8fa326bca
x-ms-traffictypediagnostic: TYAPR01MB5151:
x-microsoft-antispam-prvs: <TYAPR01MB51519B4CE122C2A52350A7FEFD749@TYAPR01MB5151.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JbHtY9uha9mXnMXbrD7qafCMxqPTo+l0SlN3tLZgXScy7IbfNzXW3wFghAJ8mCC9r/Fv73wcEiEENrijig6YwQ626fFm/nDzINFS7JhF4dBlLZHtFTdGcKu8DHVP6s2SODtO5QIK0MwRoD2p93jfkY4ZaYgd9AO4T90dZK0rMOGeET9Rc/bsG9L5Sv9hyIDWeF5d085kfCF/Jekyqa1evjg5jpUHOUBirWEuT8+pRMSw6vQl8uEXV+T3kwOq5KB/hFEK2QBLkzV3vtSossOzGoR8eAi0QHdreAMKXXjPmrtVo8t+H+rU9KNFiEGifnBBlfIjUwDFQ8XroIv71yPtYeeIx3ZDo5ml2liBfaCKrnQn909t6yFFrMn+gDeB+ttuMpZ1O6dkWCOI+vILKYIBaCRVtcj1PJBAfHjBv0MkDGVO0mNGizsxemzojIMRytXc8557wkN4L0Gx66SAay0gfcFQL1r5knjaA1ITVSR1dgeL3dO6G90OnLnCcHVoc/hZ4dhCnRP8h5HL0ioWT2R8dTUkoHJlu3VWEot7aGS7ZRKVKIxF8oVtctPGsuy0cESRA8W7ymLu32caLs78bTgNwfbHsu4Pw/B1pL20ZIXQrEsE3HZLwY2eQjouBMrZCXjQY33QYxBIU3+RIdWP1E1NQ69cDCeQ5mv6o3HadyoBxjU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(39860400002)(366004)(136003)(38100700001)(6512007)(2906002)(33656002)(71200400001)(8676002)(85182001)(316002)(8936002)(4326008)(66476007)(53546011)(66556008)(6486002)(478600001)(2616005)(26005)(66446008)(64756008)(91956017)(66946007)(76116006)(5660300002)(83380400001)(6916009)(86362001)(87266011)(186003)(6506007)(36756003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?bUVtM1dqV05va3NrcnJkVGFGUDRzd1hnS2lreWwzL3NoSER1N2xlNHBMQVcy?=
 =?utf-8?B?M0k4REk1YkpNSElkU2w5WVJuNEhVNjVpRXFrNDZFNnViNjUvQVo0NFQ5aXcz?=
 =?utf-8?B?b2tRSVA5WUNBdlNVaTRpd3UzQ0R0alVSYVZKNWo2RXVQeDlnOEJ3aU5COEpo?=
 =?utf-8?B?VkpHOUZ6ZzJGVnVJYVFYL282OHpkNDkvRElwYUlvd3VKRktKVit5QXozOEpR?=
 =?utf-8?B?Rit1ZndjVWFad283Z0E0U2xTMW1uRU9CSHNQYVJZR2o0enh2WmdMT25WVlZM?=
 =?utf-8?B?UzcvTjlTU0hJM2FQUU5lc0NJMnFwa1hKbk8veE9DSHM0eGhuZE1SS3huYWU0?=
 =?utf-8?B?TlZKa0QrVkNBMDVMK0RlTUJ1M1U4OHJ3ZUVrMGk5Ly8wN2k3Qm1xbWdpZFAv?=
 =?utf-8?B?RXZ4Q091OW5Zb0pWQ1ZsWVVSa3l4blVnMnlIZjE3Qm54NCtZaFVKaFNYeXhw?=
 =?utf-8?B?RFpVMWtnOENIVldtbW11NCt6TlR4SjRBWlF4ay9XWlV1S0ovazJ4QjlrRlBI?=
 =?utf-8?B?c1ZUeDcrRjFjeVp6VGdxbUgxV3J1dE9wbVk0TS9CVkZ0TExhTm81dEx0QnBF?=
 =?utf-8?B?Q3c3d2dPS3RVZS9pYUlkNDZKSTdCQ0kwUzk5Q1VzZFF1VkZ2THVQay9mLzJt?=
 =?utf-8?B?RzNLQmEweitPUGx4RExLL2JkZmVSeHhoTkJXeE8yL0daVHpQM2tOYzdlS3ZZ?=
 =?utf-8?B?bzVGNFA4cVlldTE1TFhMaW5nNDAydW5sb3JNeXNXeWFzaHZFM21CT3FwOGpE?=
 =?utf-8?B?NkxTL1hoRFcwcUN3dXh3WVZFZW5mWlZzNUdGZnZsZzl1eW5IZjdVU3ZIcnpC?=
 =?utf-8?B?bHkvayt0cnlMbU5hdmFOd2RWZmY2UElnZGJQbmZ6UEtTaGVUVWRRanNIclZv?=
 =?utf-8?B?UGdQUm1CdGxtNzlEcURXa0NoMXMwelFjSUpxUXFLYjFOR0ZDamJyN0ErZUpz?=
 =?utf-8?B?R3NzRjVmeW92SEZTT1RlZ0VUU1FQUndscHVJUGs4Y1hXNVBlZnVxd3NxdzRu?=
 =?utf-8?B?RXp0em5kSmhtQ29LZnBtbkZFZVd3ZFczTjBHVEtVUVBsZVNIS29SMElXZmYw?=
 =?utf-8?B?N0gzVEh1R1RRZTFaZWRiSWRQTVdXWExUQWgwTlZSOWxnNXk2VmNWTWdvVlJT?=
 =?utf-8?B?elE5cG5oME9WTWJOQVAvTUVwOVFXZGxDaXZrQnUwanFuNWVyaVFYRWMvWGZR?=
 =?utf-8?B?b0tqcmlySk9Tckt6RkJqaGJITnpyRENZY2JsZjVTNzE4WFBaRTlSUmNiVGF4?=
 =?utf-8?B?QnJqbWZ1RithMnRQdjdvbGFkSnA3M3JuTzI0d0RNTXhobWdKbkJuQUUwOGxP?=
 =?utf-8?B?WHpRQ1NVL1dzNXAzcXF0YWQrbmh5eGFSQ0JRTFluTnBvbGl3U1IwYU4raDBn?=
 =?utf-8?B?bktrN1p0akJaMHhLLy9jbEJlV1hNZ3RGUEVubW9hSzdtT0Z6U21Wc0h3VlBZ?=
 =?utf-8?B?WlFXY3IvZ05HTWlyTVY5MjQxd3RhRjJIVmh4b0VzSmhha2ZLRFVkejJUaTlq?=
 =?utf-8?B?Q3JSN3VwbzNLcEkyR2U2eUlaR1lIY1JWTFIvNFZWZFY1SHRFa0sxQjRmU1dJ?=
 =?utf-8?B?aXZTbk1lUVdaL0pSMW5VTm53S2UvdGVobG5wSS8zNU1HazRWRzlUSk1SY3dw?=
 =?utf-8?B?WllQOENXUS82LzE5U2FvS20rbWlOMVRpUzhzQ2dBWUxrUUtjVHJnRHRJUXRh?=
 =?utf-8?B?NUVkbTRZOC9YQjB4eE5WNXZHWWRrY2VNWFEvTzdaV0xsUlJGZ1ZMK1AvRDJq?=
 =?utf-8?Q?LUU4WNW/SL3Zcz+H56bHJFc25f/rva0M+Yt+Je6?=
x-ms-exchange-transport-forked: True
Content-ID: <FD614078817D2B448DDCAAA22FF851B8@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcc7415b-4317-4e76-e560-08d8fa326bca
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2021 02:02:53.5846 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7VRGXt+5thpDECaAuNqfnduaH3KmMfzeewgnNKhp7L2ARvR/R2xu4F9juWGGbaUMzSaspGGv1OhU8QhHgmyYwj3/ux1Dc6X017ohIAJtuxU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5151
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3] syscalls/semctl01: Convert into new api
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

Hi Alexey
> On 23.03.2021 13:57, Yang Xu wrote:
>> From: Yang Xu<xuyang2018.jy@fujitsu.com>
>>   /*
>>    * These are the various setup and check functions for the 10 different
>>    * commands that are available for the semctl() call.
>> @@ -67,363 +29,171 @@ static void func_gval(int);
>>   static void sall_setup(void), func_sall(void);
>>   static void func_sval(void);
>>   static void func_rmid(void);
>> -static void child_cnt(void);
>> -static void child_pid(void);
>>   static void func_iinfo(int);
>>   static void func_sinfo(void);
>>   static void func_sstat(int);
>>
>
> We could drop all these declarations by moving tcases struct
> just before verify_semctl().
Yes. Thanks for catching this.

>> +
>> +static struct tst_test test = {
>> +	.setup = setup,
>> +	.cleanup = cleanup,
>> +	.test = verify_semctl,
>> +	.tcnt = ARRAY_SIZE(tests),
>> +	.needs_root = 1,
>
> Does it really require root?
See ftok(3) manpage, it said "The  ftok()  function uses the identity of 
the file named by the given pathname (which must refer to an existing, 
accessible file)".
ftok source code
key_t
ftok (const char *pathname, int proj_id)
{
   struct stat64 st;
   key_t key;

   if (__stat64 (pathname, &st) < 0)
     return (key_t) -1;

   key = ((st.st_ino & 0xffff) | ((st.st_dev & 0xff) << 16)
          | ((proj_id & 0xff) << 24));

   return key;
}

To ensure ftok succeed, we must require root. Or, modify GETIPCKEY api, 
we can use tmp directory. Anyhow, I will send a v2 to remove useless 
funtion declartion firstly.

Best Regards
Yang Xu
>
>> +	.forks_child = 1,
>> +};
>>
>
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
