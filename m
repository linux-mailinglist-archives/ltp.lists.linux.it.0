Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DACF3CCD50
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Jul 2021 07:24:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 90AFA3C8204
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Jul 2021 07:24:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2BCF33C2E09
 for <ltp@lists.linux.it>; Mon, 19 Jul 2021 07:24:20 +0200 (CEST)
Received: from esa5.fujitsucc.c3s2.iphmx.com (esa5.fujitsucc.c3s2.iphmx.com
 [68.232.159.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id CB6ED60245B
 for <ltp@lists.linux.it>; Mon, 19 Jul 2021 07:24:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1626672260; x=1658208260;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=4KJ/K5HMmj5Fy7k+haPwJpCi0folBNd122lA73bWrrQ=;
 b=vfLGHPb9fpdCV/leoU8KATV50osl7qVTDNduUlNRIZ+caVCh+URb6UVV
 H5XKvZDrmwyAS6aeO2D4Xtwi09I74We8V7vBDxn7xQM7nZWlek470rnN9
 Wlmoajr/X/0o0yfKljSk6f9+Gip9/q+PzTKkdWIdc3d6UQmuRPDLUAM7O
 OOFQaP+POQorl7cEsDK6GSgSHOQWiM+DhmcIqPeK+pVEvS81J9FKVpH62
 BJKTgzepmHnzI3X3a0yGKngRYOOCbEVaXEGfIN5vF7OUiB63iX6qdKaR3
 1a6dMeExBjIZrZZnue/OxmxyXbCykr1L9/nXGiDK3P/cuCWHfRa+/MT2D Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10049"; a="35191101"
X-IronPort-AV: E=Sophos;i="5.84,251,1620658800"; d="scan'208";a="35191101"
Received: from mail-hk2apc01lp2059.outbound.protection.outlook.com (HELO
 APC01-HK2-obe.outbound.protection.outlook.com) ([104.47.124.59])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 14:24:16 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dgrh0m1jPWVrrq1kkLhViGMG9QjsL/rBsBx/WCXhGhzN5SJybxUyo/DmIlu8TXLgGO/z66uOcGyRl5qvLpwQhltiHJ1Jf8aURwCaS8fJcvb7kkS0HCLKNLzWxHMy0yijO6avyodr5PT5+vjEpOD/w5Zz22+Ru7XpNOqnLWpqcTQ4hdsndihBLN9QVP6ginKik+qK557FmAOLQqRPMFlG6a0yJWFFdswprabNh+UEzkLfFyN9GU5XrCASsdY2ogFfTw6Z/yiHUjRwjA806I1oSNs/tp9U5mYeyrtZ/YsBj8dU5m8X5vCIQtJCFlQpS4TY+BowoIQLVDzknfTE73vADA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4KJ/K5HMmj5Fy7k+haPwJpCi0folBNd122lA73bWrrQ=;
 b=n9bqqPC6htEP92UHMrV1I6G7pAIB5uFzSdJZu6jZ1M7k9X0+72mZaXg2Cfh0RmBkNE753vfciAO+5OK7Td90fIX9jyrNEXXjuP/gYf8EcylGIBjkKDU2/48f8934ARN4ySN6TSfZE14YhH8u2yUF/280UkMZJ+aPkdXPVErL61DJBKgKOLuY1w5PJzhyTSYFTSH7uQhAn15Btq1lYfRS7zeZXy3ZWFaC7+lfmmiU2Ls1b/P5ved9GImKSwNVnGi0KmOOnj0/pyTGH9s2CPBnjywrsNHe5N3wMCTgz6wZ9rylfBuDF6QZ6VznHYxRtTLmMBZD4cpHe3YY/wRbfT6s5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4KJ/K5HMmj5Fy7k+haPwJpCi0folBNd122lA73bWrrQ=;
 b=qED0hG/twzVW+BdggBGSKGxaPFNv8B+Us7hazM7AQwj5w4D0vdMwJcM84/G9z0yw2gXLzWFyzLUqBelTUSpkw87mDEjpkbzO/1LD+3ffN1Jm210ifxtPdbWGgEZCjDKwlxkJGUoC2r5CUrJGoOyTc80mI5DI7bdUP/TTWYtg+MQ=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TY2PR01MB5195.jpnprd01.prod.outlook.com (2603:1096:404:10e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Mon, 19 Jul
 2021 05:24:12 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0%3]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 05:24:12 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Leo Liang <ycliang@andestech.com>
Thread-Topic: [LTP][PATCH v3, 2/2] cgroup/cgroup_regression_test: Fix umount
 failure
Thread-Index: AQHXekte1MNnjfn9+UCa58tsCYGAY6tJyBwA
Date: Mon, 19 Jul 2021 05:24:12 +0000
Message-ID: <60F50C8E.6020405@fujitsu.com>
References: <20210716140235.GA22205@andestech.com>
In-Reply-To: <20210716140235.GA22205@andestech.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: andestech.com; dkim=none (message not signed)
 header.d=none;andestech.com; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a61a6abc-e212-4802-aa57-08d94a7571ad
x-ms-traffictypediagnostic: TY2PR01MB5195:
x-microsoft-antispam-prvs: <TY2PR01MB5195F919D87022B1DB0185FDFDE19@TY2PR01MB5195.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LH02tkKk71Xc7OEdyIPg7PGNPEC7mD2idIZsASAb1kDP/vBXCAKmpkIw4wnd21kr+nL+JgVsMbbWwm1udXkjIvJq2pzHJt+Fr+F0jIfgmM7MU7/fDfK/VcZ2A9Dhp16Kml+LwrB2GwUDVNxs/KHmdVUgLU74TX4kcqilgiaH8/l0zITWaGIUxVyfdaeWj/6eQ1nT39EUXDccjCD+81Pja1RW038vB3aQunKx4ZaNYR3iLipA/g5+32pMGN86+rDWGgG5Qmi8+EAuUOfE/fQmN9qfasf/v7Wu0+GcL5h1x4ga1m+HIXAEYNQuovMb1Tju2w52w5bGCU57gnCj3fK8oX4ygSM0lzv7M3UwZU8EX7L5y1haPQiPYMEL+vWuCeo/IyXxIeIBPB5tNFtP3mmMgxr3js1VCSgUifbRgj8hfbkMDTQjFAC6wK2zSSFRHgjO/Jpitp5jE7AonzwJxYBDsoBqd5jJMEbZa8+t0ZDg+Jv/zLeOnYglIfIWJrx2L2dxJtvW13NV+nuWYLS5w0b/ZcdYkZpIXyhwhN2ZForlaqWgyBLx5EmArsKCWGHAQtICD0R+YLPvNNcM/D9QGzk9A4Bfuq091W6/f1FC30jJV/NhwfV8G3WjzsCEaunN55C0vzJgd+/i4rGjO2c3xZf9bb6yw8S+WcNCb3OjT2VVdq1EGAV6uPpmc2Vbny/iXOC8Fw3wXYcYOl7mimoDIiqV0SNSGzL5fpAY3Ls4gZVqP5I=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(396003)(346002)(376002)(136003)(5660300002)(38100700002)(66946007)(66476007)(86362001)(4326008)(6512007)(87266011)(36756003)(33656002)(2616005)(71200400001)(6506007)(478600001)(122000001)(76116006)(54906003)(83380400001)(186003)(2906002)(8936002)(91956017)(6486002)(26005)(316002)(66446008)(85182001)(6916009)(64756008)(8676002)(66556008)(21314003)(38070700004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?QXZpdU5zRHIvSUx4S2diUTRSOEtEZUhjL3RjaityZjlGWG4wZWJ6NzUzVlhs?=
 =?gb2312?B?NXB6dlRUNWptMWtwNTlickMwQ1NRRStCRG1EOEc1T3VUUGJIb2Mzb1pnU3Bq?=
 =?gb2312?B?dmtvU1ZFYUU2b3ZRZVpBU0dWSUlBZHptTmFQYzROSlZEL2p3cXlLZ0FrcjRN?=
 =?gb2312?B?TEw3TS9QVWlQK0NKK1Q2Y3d5empBbjRLSHhrUkpFVEJyOTlMNTdnNjM4SU11?=
 =?gb2312?B?OWpnajNHSDJJSytWOWhlVjY4STlVbnJVMjRyc0trdkdJQVJMQjZqdERSV1c3?=
 =?gb2312?B?bXZiMkF2YkNiYWFuNDVESlJqTUxGem1JSnI1UjRKME9GZVRhU0RkQVowQmxD?=
 =?gb2312?B?dkVBWjRqeWhIODc5aUp6NC9sWjZKeFdCd2xtZkZSK09CREJneWJrSGFpa25C?=
 =?gb2312?B?UTVZR2hZKzBxSG9wV3BvaVhHUzlPSFU0djRjUE9BWlkzZUFYWVU0M3RmMVlK?=
 =?gb2312?B?L2FEZWJ1MlJGc2J3MHFOMGQyRk54alp6eHdncXE1RElYUUdIK0hMbStjeGR2?=
 =?gb2312?B?bEdzU0NiY2dQeVM4VC9HQnVaSjhuNmpJbDdyTk80TktxSHlRODBXOU9kR2Ew?=
 =?gb2312?B?OFk4V01lMDE5bmltT2NnNTBrR202U1N2UkpVbXNPSS9oanZaTEZ5TmlMZ2F4?=
 =?gb2312?B?MGJrZWRUZ0lRSGlRdHdGSHN6dUkzZWpUa2NaYnZFN1lYM1psa2hDclpzV1VU?=
 =?gb2312?B?NlZRZjE3VkpWUms0dSsyMnpRRFJEQ3F4eVU0MTE2d2tGNk5Hb1hmWDcwSGd5?=
 =?gb2312?B?akI4bG4xK21rMFJDc1U2MnN4Q0hMVHR5cnN3M1AxZ0JKL3lrYjNZdGM4anJD?=
 =?gb2312?B?NjRqV1pUOTJqT0JxUVp1Q2V1SmFjNEFyUUFRaThtRDdra25jRjc3RVFkQjR1?=
 =?gb2312?B?L3RoTWxVZEJXejNlc3k0V1ZlZy9yOG92SEhpUzRIQjZWYWZpazE3N1dpeHlS?=
 =?gb2312?B?elN2LzRjaExXdzlDY0FGMXNnMDUxTnRPQzF2VVRxYWIrbFhRTDQ4cUYzYjZ5?=
 =?gb2312?B?ZTJFeXZsRGFhekRNL3prSHh0dnpqYnpURVE3a08xdXF2TnZIUjJUNDQycFo1?=
 =?gb2312?B?bGNYMGpyRGs2VjN2Z09Jd2Z0dm5sOGFTbkhjUm5ZVG03Sk1vZ0tMZTdGZjBS?=
 =?gb2312?B?cEwvKzdzbU10bTNOdkNzTzVWMEExOHNpYW9nZ3dOWEhHc0I2NkxnL0dKeXJr?=
 =?gb2312?B?aGNXMnd6cEpvNlIrOXByemFoKzVFbE5pNktYVDJZM3lJZlJXblZEZ1NFU1Zh?=
 =?gb2312?B?bzNaeGNOK1R1QkN3a1lzTnVRWVZ2aEpveUJ6T1preVBubXYwaSt2U1JmMWly?=
 =?gb2312?B?K3RkNGttVjYrQk1uV2RBZjA3OFpXbWhKWnYvL3Zzcmx3bEFhVExZd0RiTW9u?=
 =?gb2312?B?YUx4MlVJaW1QTUVCWlVteUNzVmVNWUhTb3E0dXIyc1cwSy9Mckpab1Y3b3d1?=
 =?gb2312?B?ZjJmOVI3cGJqVlRDRzcyWEtMNFhIaStnSGZ5SjFRU3VZamVpeFM0WEJlbXhW?=
 =?gb2312?B?WU1IQUtCVGtMQUVUZCtXWVRmMXFNbmxGeURTUmEyUzNzZmVRYU1WTHhnZ1Yv?=
 =?gb2312?B?bkJNb2dlUWlDZHo1d2hzbDZjRlRMdWp3eVJXTHhodmdDckEvZzJZeUhNMTV1?=
 =?gb2312?B?bDVSRkZ0Vndjak15eDBsVlRtTzBDeERJY2JNRGtiM0FtbnNoMnJoNU16SXln?=
 =?gb2312?B?RUtXWGZxL3RVWW9mZ1gxWWV6U1FKdmY0ckhHOE1tUEV6dGttMnNsMVhxenl2?=
 =?gb2312?B?dzU3VjhtQ1Y2Vm1SSlFrUWxHcUxKTVZSWlR6eExVQm5nZVBLVHBIc0V3Z0p0?=
 =?gb2312?B?ZlVkcWJGVFUrdjRId0Jidz09?=
x-ms-exchange-transport-forked: True
Content-ID: <05F13ECBA16FF84C9D9926782B03E36C@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a61a6abc-e212-4802-aa57-08d94a7571ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2021 05:24:12.8013 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: enFhk6sjoEq8T98HWSiqbMViBBnQ0J09vf7fDP7kw6aALbcixxk/ijpizjArWUHy0+jBnnu1L2n74eoelPLRj381qNdISatbizFN/fT1J9Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB5195
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3,
 2/2] cgroup/cgroup_regression_test: Fix umount failure
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
Cc: "richiejp@f-m.fm" <richiejp@f-m.fm>,
 "alankao@andestech.com" <alankao@andestech.com>, "metan@ucw.cz" <metan@ucw.cz>,
 "ycliang@cs.nctu.edu.tw" <ycliang@cs.nctu.edu.tw>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Leo
> The test sequence
> 	mount -t cgroup -o<controllers>  <path>
> 	mkdir<path>/<dir>
> 	rmdir<path>/<dir>
> 	umount<path>
> 	mount -t cgroup -o<controllers>  <path>
> would easily fail at the last mount with -EBUSY on certain platform.
>
> The reason is that this test sequence would have the chance of
> missing a release code path when doing rmdir and umount.
>
> Adding a little delay between "rmdir" and "umount" could fix the problem,
> so use tst_umount API instead of umount in "rmdir, umount" sequence.
>
> Fixes: #839
>
> Signed-off-by: Leo Yu-Chi Liang<ycliang@andestech.com>
> ---
>   .../controllers/cgroup/cgroup_regression_test.sh       | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/testcases/kernel/controllers/cgroup/cgroup_regression_test.sh b/testcases/kernel/controllers/cgroup/cgroup_regression_test.sh
> index 1f7f3820e..056166f11 100755
> --- a/testcases/kernel/controllers/cgroup/cgroup_regression_test.sh
> +++ b/testcases/kernel/controllers/cgroup/cgroup_regression_test.sh
> @@ -145,7 +145,7 @@ test2()
>   	fi
>
>   	rmdir cgroup/0 cgroup/1
> -	umount cgroup/
With adding a comment like
# Avoid possible EBUSY error

so when other converts this case into new api, they will keep to use 
tst_umount.

Reviewed-by: Yang Xu <xuyang2018.jy@fujitsu.com>
> +	tst_umount cgroup/
>   }
>
>   #---------------------------------------------------------------------------
> @@ -193,7 +193,7 @@ test3()
>   	wait $pid2 2>/dev/null
>
>   	rmdir $cpu_subsys_path/0 2>  /dev/null
> -	umount cgroup/ 2>  /dev/null
> +	tst_umount cgroup/ 2>  /dev/null
>   	check_kernel_bug
>   }
>
> @@ -222,7 +222,7 @@ test4()
>   	mount -t cgroup -o none,name=foo cgroup cgroup/
>   	mkdir cgroup/0
>   	rmdir cgroup/0
> -	umount cgroup/
> +	tst_umount cgroup/
here as well
>
>   	if dmesg | grep -q "MAX_LOCKDEP_SUBCLASSES too low"; then
>   		tst_res TFAIL "lockdep BUG was found"
> @@ -254,7 +254,7 @@ test5()
>   	mount -t cgroup none cgroup 2>  /dev/null
>   	mkdir cgroup/0
>   	rmdir cgroup/0
> -	umount cgroup/ 2>  /dev/null
> +	tst_umount cgroup/ 2>  /dev/null
>   	check_kernel_bug
>   }
>
> @@ -290,7 +290,7 @@ test6()
>
>   	mount -t cgroup -o ns xxx cgroup/>  /dev/null 2>&1
>   	rmdir cgroup/[1-9]*>  /dev/null 2>&1
> -	umount cgroup/
> +	tst_umount cgroup/
here as well
>   	check_kernel_bug
>   }
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
