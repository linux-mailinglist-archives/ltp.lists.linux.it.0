Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4326034E3AB
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Mar 2021 10:58:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B6CA63C7811
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Mar 2021 10:58:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 835FA3C2476
 for <ltp@lists.linux.it>; Tue, 30 Mar 2021 10:58:51 +0200 (CEST)
Received: from esa9.fujitsucc.c3s2.iphmx.com (esa9.fujitsucc.c3s2.iphmx.com
 [68.232.159.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id BDB50600A10
 for <ltp@lists.linux.it>; Tue, 30 Mar 2021 10:58:50 +0200 (CEST)
IronPort-SDR: AbAhdM5c9F7U7guEseuVztZE24W5Z1m7sUr2L4sSTDi4umdc/jgA+02+qvcLpRrfgQLAHhIYBF
 dqu9wfHhQ6UWMQ5q700v3a8khgrf38sB7cpqKFzH/z7OIRqzS9Xv5OujCSmT5rdYkgHmmo3Ul/
 OYl4bQPF1i9+0dthTl116cZVRutOgG8bRy17qLFSSdszY1VWvw2P9fGHB1/UOCpczorw5XWAV/
 YbSEPpAt2KSMJKhEGzh66iLvRjVpywz8UXfTFFmV+5p/pB1rvbYpYICI3VK/f1Rla+/qxpk2GT
 ZLc=
X-IronPort-AV: E=McAfee;i="6000,8403,9938"; a="28815780"
X-IronPort-AV: E=Sophos;i="5.81,290,1610377200"; d="scan'208";a="28815780"
Received: from mail-os2jpn01lp2056.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.56])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2021 17:58:50 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X9OXn964P16QrivgQpJV++FzfgOvQgf2C5Su+u9PvxvCGd1m7CVo7FYL1UEb3rdQJInX4AYGAfdJ6PkxUGsaU7MFSrfWQMH/rv10U0nINEowIl4bwk4MxnqhlN/gh3CB0rf2PHjcqtN/B011yVA9G+29UcUgdWLoenapl2o9QlNvzs1Bks/ODSkSOOrvRXssfXvm6M2+TIcaTPVSzuj0OOv35pyBppBNILkRwk2LYV57TWAEOqNpWjyTRKUZ8bdBripqyP4FzxmwnuBHKyW4E42ykS1U9+RK2W+VRlH8BBkttCLV6eqTSobX0AaRnnGQO+BdWSAHapXazfTp8q2taA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/mhLuNwHbR+3B1saDhZ75bm5qlvag/Xls6Z/FuTt6Fw=;
 b=Kv8C3kqlsKNde3I3LQJKnaw180eARuO8gsLhNpU1hAtuxyss7ThOJHFovqMeMk5Nl9dU0vdpb/qEF1uYZLLnq5TwcU11I6QOBAEnOfp05PjJwS6qtXECFjwu/M0pqRGuQqguhE8GPzfJsWH+nGZEE8RG2Y/dTxzJh9vr7zrBkt01L/eZwp9PaQHJUtshXD/peuG/ADsv5mNur1dmcBMdhlEipcJBrVHZ24HrDxNUpjAN4pGLWpKEQ6ZKXth9J3fpNnptZ94w5ozmCQJi0hMvxOn+Afz72lyR9Ic3BNqtlSXNRc04dGJp11r9LZJ60I7G4CsPTk+ZAWHjG/c4F2gFLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/mhLuNwHbR+3B1saDhZ75bm5qlvag/Xls6Z/FuTt6Fw=;
 b=UGti+6i5vAdJYqODq0LZBXfLJX2nO6iBSbRTCljyL8IIAaI3Otyj9mgf9MRbPKWUaj34GfcNH+Cq+Ks+rYnX/shZdPlepJKH8we7uPRWcI/CYWIglXUlTudVhOpbGJVClJwsYakWiC3SdGRxFAzq5N+V/PmemUl+/ziUjWwmJp8=
Received: from OS0PR01MB6371.jpnprd01.prod.outlook.com (2603:1096:604:104::9)
 by OSAPR01MB5204.jpnprd01.prod.outlook.com (2603:1096:604:64::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26; Tue, 30 Mar
 2021 08:58:45 +0000
Received: from OS0PR01MB6371.jpnprd01.prod.outlook.com
 ([fe80::d890:a1e4:ea0a:15c0]) by OS0PR01MB6371.jpnprd01.prod.outlook.com
 ([fe80::d890:a1e4:ea0a:15c0%5]) with mapi id 15.20.3977.033; Tue, 30 Mar 2021
 08:58:45 +0000
From: "yangx.jy@fujitsu.com" <yangx.jy@fujitsu.com>
To: zhaogongyi <zhaogongyi@huawei.com>
Thread-Topic: [LTP] [PATCH] min_kver: Add kernel version requestions
Thread-Index: AdclPUWCVB0ckTDPQrOjP7cNve4wJAABZ0OA
Date: Tue, 30 Mar 2021 08:58:45 +0000
Message-ID: <6062E843.7080908@fujitsu.com>
References: <F3D3F6AC3820BB4C9FCA340DB5C32CB40389E765@dggeml531-mbx.china.huawei.com>
In-Reply-To: <F3D3F6AC3820BB4C9FCA340DB5C32CB40389E765@dggeml531-mbx.china.huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [180.96.28.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ae6e8fec-8e85-4341-779c-08d8f35a06a7
x-ms-traffictypediagnostic: OSAPR01MB5204:
x-microsoft-antispam-prvs: <OSAPR01MB520462B69156579D2327F271837D9@OSAPR01MB5204.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RUOmYuv1UNXNDNEJzCDr/V6Dn20NcDkkflYNr/Fd9bQS5H+z7kbdDLKxOcYKDvLZx2bJZ2G5Z71JaEtYUDVk9OPlBKUOwE1svX9MO1J6AYDSjKZHKtL5Ag9r3Mv06FrCUSMLhGWa27w2336kjFiT7AYU1KTDJCj46iL0nvJqPFy1HcY+IgCXZWMhpATayogPi7jeHby6a7xSCyiVI4S/UAovervlkQPkhKonKe4KvXY3g/o9HMo24Ca0JPcHjKtuF4UGwoq1lSi4NcptpOgLAmjpHpjUMjhNEtx8+Mz46saKv/1pgAKnP/2gTT82NQWP4n1pXcN5MMCJmXafBGeL0GkIKkedrX5At+8jpgQQIchyxcfaysP02P6goWIIKNXEQttyDcIyv2K3+ByKOeJWFqxIgUi7aVe07XPQ2fdc62TNaZAiH6sidKejGGym5A6CzAuewMgCvtr1SgNaTf6EDdhxMg7I8ohGPsZkpHNuhayuxjDsw2SBK9woZTwhLn5nTdc00XdEMmJAFRqnxujzpoD5BmwhQLI37rP9vKQOhRhrRB0bAL/EMtVisI3LPChK4lj88RIm4QT9dgAh84pi89seH0ObpsryjtjRnKIUVeNF4wMxuSspl7h71XkxGUdaxifBSoYWhKifhfdcQTr4U4MdKnDKho2BpqRLJpdrhk4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB6371.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(136003)(376002)(39860400002)(6486002)(87266011)(85182001)(26005)(5660300002)(38100700001)(6916009)(4326008)(478600001)(66556008)(2906002)(33656002)(8676002)(316002)(36756003)(91956017)(6512007)(86362001)(64756008)(66446008)(66476007)(83380400001)(8936002)(6506007)(53546011)(76116006)(2616005)(71200400001)(66946007)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?gb2312?B?MkluaU4zQVVyZzF1WFdaL3JONmhkZmlOQm9XVDRBanhHU0F6MnIxQ1dUa2Va?=
 =?gb2312?B?T1c1VVI3VmFCcDNNR0xiWkpxcWM0Nk5YcTRyMW5YeUk4Mm1zc3JIcjR5ZGZ3?=
 =?gb2312?B?VXZXUG9rcDV1R3c5YUFPcWpETkRROVJrdEdRbEZUVUJNaG9JbmVHM2t2bkdG?=
 =?gb2312?B?WDZKYzkrdzdUaU9Ld3BTLzNqeUgva3l6c3V2TzJleEgwV21USENrZ1dzMHE3?=
 =?gb2312?B?OGlZM3VqRmdTRktpWTdxWG1NVGRhMHZibm9RaWxFTFV0NlJTNUpMNHhiZ1VN?=
 =?gb2312?B?VmE2SUxmRkE5emh3RXoxNkNRYmd4ZlFwbGtYdGF6V3FGOHViYUV2a3A1NDJI?=
 =?gb2312?B?eXV1UnF0ZmZiMGlGMmJIV2RqSzdWKzdYUGZSb1pKYXlTQ0RnZTVUYmc2R0dZ?=
 =?gb2312?B?RXg3cVh4amVubjNWN2xUMW1KeTNpVThZNUpSeXpjVUZFc1BhSGk1UzVTSUFy?=
 =?gb2312?B?OWhrMHB2R0VmMW5xSEx6aFN1cWtBeUd4QTVVQThwTFd2T2JiM3FLcGtzc0lD?=
 =?gb2312?B?OXBDcEdENS9XME9BMm5rNkRkNkFPTExGRjV1K2RXeTI2S0ZjNU5mMlFJUGM0?=
 =?gb2312?B?MVcxWkk1NWw1MERPNVFCTGt4U1hFOGRFMGtIc2FhZ09GM0oxaHJ2SUV0VjRN?=
 =?gb2312?B?QTk5akhjaVJsRUZYRXJRb1ZEQnFJUU1uVW5YS0oxTnY4TUFvVnVsaUtKa3A0?=
 =?gb2312?B?MTRxTkNKVXBtKzZwZzZaS0QyZnd1d0cvSmdQTHBZN1dvN2M4ZHcxcGVCWkIw?=
 =?gb2312?B?ZlNTUDlvWDJaWldtaEF4VGlhM1QvVFNEdEU2NC83VlVqQm1IT28zRll4ZTlY?=
 =?gb2312?B?WVpkZG8xdk96dWI2c3JtZ1l0M3loSy9zUUwrUVV5WitVcTNwNzZ0RGZLVE15?=
 =?gb2312?B?bWZSQ3FWSk9uSXJocnBLQUZKTm5sOUM2RzJWd0RhenBQbXNUUmpzemFSclh1?=
 =?gb2312?B?Mi9FK3ljV21KWVdtQkhnMHpGU0hyU0w1ejZtOHBGellDVXkrQXdqbmFqU2JI?=
 =?gb2312?B?dFlKTkp1MEJzdTZpTkV2enJKV05VcFZOWFFEWGxXR0pUZHBLTFNvcGwrZlQy?=
 =?gb2312?B?L0JqSG42Z2hsNTREcDZBRlNiVU80UGZpOWgwbmViODdNeDJyU3o3TE9Ha2tV?=
 =?gb2312?B?V3k4TDkyT1J3QXJqY1cwL1hIdUZkUnZRRThZdjUvM3dsTHJXWmI4YWI2RytG?=
 =?gb2312?B?ajVUWFpXUFdkbWxwSzRudEdUMzlFK0MrRjN3eVhoNnBnTWdKZDI3UVFYcVkr?=
 =?gb2312?B?cXNjMjNraEw5RzA2emNzOG5QRUxaMnlmbkZCUE9SSUQzcVR5QWw4VnBuZFVN?=
 =?gb2312?B?YlYvZzlJRG5DSXdmeDdQc3pIdEc0RjV6NVRhVjJBU045YVFVMjlianU5dThQ?=
 =?gb2312?B?SXR0cDZEUVhqbjA1UllYWGtZVU4yL0RJMUtzRi8yMEYrYktJWTZjajdETW1a?=
 =?gb2312?B?a0ZReXYzOCt4bUdSdTdJbzM2Z3ducEw5dWxaUDdiWTRES2ZWcXAveTlpeWYw?=
 =?gb2312?B?bVVTL2VQUm9mZUZyTFlIV1dGUFliaml3UlFFL1F2SkcrMXVXZ0ZmQW1LTkhy?=
 =?gb2312?B?ZTY2d0lnVVRCQS9pRTlPOW5IYUNEaGNnRUlzZEhaMElBQ3hQajdXTnVTQmJz?=
 =?gb2312?B?VUlQOFlXTlRXdDFEalNhd29aMC9KcjdZVDhGRUdjdWc2YkV6NWZFRzlZZCtG?=
 =?gb2312?B?S2thS0ZXREhrSVR1WmVvZXM4RjArSktJelVPdWdmYkVVZTc5a0l4QUdtdGxk?=
 =?gb2312?Q?Gm3AwViM/0tgmb9IeloOfLnUAJS1P7hO50IW3Jv?=
x-ms-exchange-transport-forked: True
Content-ID: <66ED888325B02A43B4C7CA695FEA9714@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB6371.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae6e8fec-8e85-4341-779c-08d8f35a06a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2021 08:58:45.6214 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qgZbDnUb7CVxb1WduMH7O49wIFV6YEn50mV/0wEQcqvkvXxl0fjY7N0SDqQjcWM5WVrJqzZ22uvgpVmHAReJ+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB5204
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] min_kver: Add kernel version requestions
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

On 2021/3/30 16:18, zhaogongyi wrote:
> Hi Yang,
>
> I have seen the function definition in lapi/preadv2.h or lapi/pwritev2.h, but it seems not enough.
Hi Zhongyi,

It is enough to indicate that preadv2() and pwritev2() are supported on 
your enviroment.

> I run the testcases preadv201 and pwritev201 on my qemu, kernel version 4.4, arch is armeb, and report as follows:
>
> # ./preadv201
> tst_test.c:1294: TINFO: Timeout per run is 0h 05m 00s
> preadv201.c:91: TPASS: preadv2() read 64 bytes with content 'a' expectedly
> preadv201.c:91: TPASS: preadv2() read 64 bytes with content 'a' expectedly
> preadv201.c:91: TPASS: preadv2() read 32 bytes with content 'b' expectedly
> preadv201.c:64: TFAIL: preadv2() failed: EINVAL (22)
> preadv201.c:64: TFAIL: preadv2() failed: EINVAL (22)
> preadv201.c:64: TFAIL: preadv2() failed: EINVAL (22)
>
> Summary:
> passed   3
> failed   3
> broken   0
> skipped  0
> warnings 0
>
>
> # ./pwritev201
> tst_test.c:1294: TINFO: Timeout per run is 0h 05m 00s
> pwritev201.c:96: TPASS: pwritev2() wrote 64 bytes successfully with content 'a' expectedly
> pwritev201.c:96: TPASS: pwritev2() wrote 64 bytes successfully with content 'a' expectedly
> pwritev201.c:96: TPASS: pwritev2() wrote 64 bytes successfully with content 'a' expectedly
> pwritev201.c:62: TFAIL: pwritev2() failed: EINVAL (22)
> pwritev201.c:62: TFAIL: pwritev2() failed: EINVAL (22)
> pwritev201.c:62: TFAIL: pwritev2() failed: EINVAL (22)
>
> Summary:
> passed   3
> failed   3
> broken   0
> skipped  0
> warnings 0
>

It seems that preadv2() and pwritev2() cannot accept the offset argument 
which is set to -1.
You should find why preadv2() and pwritev2() cannot accept the offset == -1.
1) If LTP introduces the issue, you should send a patch to fix it(not 
add kernel version check).
2) If kernel introduces the issue, you should keep the test becasue it 
exposes the kernel bug as expected.
      Of course, you can also try to find which kernel commit fixes the 
issue if you want.

> See man 2, we known preadv2() and pwritev2() first appeared in Linux 4.6, so I think we need to check kernel version in testcases.

1) It is wrong to work around the issue about preadv2()/pwritev2() by 
kernel version check.
2) As Xu metioned on your patch(syscalls/shmctl04: Add kernel version 
requestions), kernel version check is not the best way to indicate if 
preadv2()/pwritev2() is supported.

Best Regards,
Xiao Yang
> Thanks!
>
> Best Regards,
> Gongyi
>
>
>> Hi Zhongyi,
>>
>> Do you get any issue here?
>>
>> It is unncessary to add version check because LTP has check the support of
>> preadv2/pwritev2:
>> 1) Call preadv2/pwritev2 directly if glibc provides it.
>> 2) Call syscall(__NR_preadv2/__NR_pwritev2) if glibc doesn't provides
>> preadv2/pwritev.
>> 3) Report TCONF if kernel doesn't support __NR_preadv2/__NR_pwritev2.
>>
>> Please reference "include/lapi/preadv2.h"
>>
>> Best Regards,
>> Xiao Yang
>> On 2021/3/30 15:44, Zhao Gongyi wrote:
>>> We need add kernel version requestions sinc preadv2() and pwritev2()
>>> first appeared in Linux 4.6.
>>>
>>> For those:
>>> 	testcases/kernel/syscalls/preadv2/preadv201.c
>>> 	testcases/kernel/syscalls/pwritev2/pwritev201.c
>>>
>>> Signed-off-by: Zhao Gongyi<zhaogongyi@huawei.com>
>>> ---
>>>    testcases/kernel/syscalls/preadv2/preadv201.c   | 1 +
>>>    testcases/kernel/syscalls/pwritev2/pwritev201.c | 1 +
>>>    2 files changed, 2 insertions(+)
>>>
>>> diff --git a/testcases/kernel/syscalls/preadv2/preadv201.c
>>> b/testcases/kernel/syscalls/preadv2/preadv201.c
>>> index 91e2b9889..e8220f94c 100644
>>> --- a/testcases/kernel/syscalls/preadv2/preadv201.c
>>> +++ b/testcases/kernel/syscalls/preadv2/preadv201.c
>>> @@ -111,6 +111,7 @@ static void cleanup(void)
>>>    }
>>>
>>>    static struct tst_test test = {
>>> +	.min_kver = "4.6",
>>>    	.tcnt = ARRAY_SIZE(tcases),
>>>    	.setup = setup,
>>>    	.cleanup = cleanup,
>>> diff --git a/testcases/kernel/syscalls/pwritev2/pwritev201.c
>>> b/testcases/kernel/syscalls/pwritev2/pwritev201.c
>>> index eba45b7d3..a8273e59d 100644
>>> --- a/testcases/kernel/syscalls/pwritev2/pwritev201.c
>>> +++ b/testcases/kernel/syscalls/pwritev2/pwritev201.c
>>> @@ -111,6 +111,7 @@ static void cleanup(void)
>>>    }
>>>
>>>    static struct tst_test test = {
>>> +	.min_kver = "4.6",
>>>    	.tcnt = ARRAY_SIZE(tcases),
>>>    	.setup = setup,
>>>    	.cleanup = cleanup,
>>> --
>>> 2.17.1
>>>
>>>
> .
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
