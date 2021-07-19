Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 713743CCD49
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Jul 2021 07:19:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CEFEF3C63FE
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Jul 2021 07:19:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9A0133C2931
 for <ltp@lists.linux.it>; Mon, 19 Jul 2021 07:19:25 +0200 (CEST)
Received: from esa9.fujitsucc.c3s2.iphmx.com (esa9.fujitsucc.c3s2.iphmx.com
 [68.232.159.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id EF17414088EB
 for <ltp@lists.linux.it>; Mon, 19 Jul 2021 07:19:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1626671964; x=1658207964;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=3FT+sP1jcdniGoekRM/1N6NNBS/jVFfyREBSIb+wacc=;
 b=FwMIBQH1c4Z1pmS3KSCDLZih8xExa8roI3XJqWrky6d4vemvQk3R8t6K
 WRVnivkfPClmKZu3GmgLebZfDw4zHCKEa83Y9LRb2CPbztHBWqNdh6OJp
 wKvZ1bWobNXhcANJu4k7z4iKytkLGDBELJSYiiJ9VV6lWqbfMgT6XY7Yt
 juWFU6k3XEk/BEqMueSQ1fAnNXG1a13lFKW2lOivF3ZUrQrHFrdjEeqXW
 5sdlLRYN/HxvT00FvXqmyo1v89iKZHdfWHIPfYb6aGxAxLOTDBCv0k+kA
 W+z4C8/m1DoJ7x5yJZ2clN0KdUH6iXJ34tUSOlHAmkJtofoYjKeiMESXj A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10049"; a="35216939"
X-IronPort-AV: E=Sophos;i="5.84,251,1620658800"; d="scan'208";a="35216939"
Received: from mail-sg2apc01lp2051.outbound.protection.outlook.com (HELO
 APC01-SG2-obe.outbound.protection.outlook.com) ([104.47.125.51])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 14:19:20 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TdIHaZdpeuYnCci6Mn1KD4856YAXbPbvJ52JGYr4jqD+BlBM7O8koRVHzEnGpyDLRP/rP129CYpoURVvjM5iGayP4Z1ge2MqldUcq9NWQrdvfTW0sgLkZBgGfTP9tAj/TYRAjMeHQ7SIbFJC2obysI+vkNx6NcoXSafFRNZJWNw23GNlEmWVtiyXqpYpbZUKdZpFaF9WXBp9uTJjIgwDjsiJeO4OI1/NVSu2K36nGynh3ZvQxcoxrzyfksP2ODQjA8mMZmT+Xc5jWvZ7aXSSYWEnMDLJIaTnyhZM1wTVzeTBDYIKOKQw4i55407EfkcFlC1YwiFPlQA6MopxojwNmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3FT+sP1jcdniGoekRM/1N6NNBS/jVFfyREBSIb+wacc=;
 b=T22NcYEgBhLekRd4YzNyjvEfCLsPIh1Jxi8z4LK6ElHJE1RpJIXOlV2WNGlTBU9Yu9s6fSq8PME+H6JB7/aiYPLL6AsS3I3yVOYw3EHKSWVv1DJVdd4/fv4ujnl6lL2RygH+nGsxkbaIndcrAkIR9IAodlJiu2rEji2YbJ56Znl93CP1tQvof51hw54ju162Wl3B/u/vDCc6l7+jmQEkkEvZXLEMFNWA42Jtn585oYSCR3t+R32H74Bkz5QttWY2wyuRxn4Bdl/Ys7oxz62JlQLzbB015bX9rN1TfpJ6TSdYn0FnhvczrfWwys5sKt2V0qI6j0o+xZkhKV2dnfxmjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3FT+sP1jcdniGoekRM/1N6NNBS/jVFfyREBSIb+wacc=;
 b=eozjgUSKarnnObmgjH8HLg8sWreExHzp00cwHXYLPN5QruLmKKmgui72lwEm9Ev35kNZ+v0jLe4cFIITRQGMFGG2rKndusArOp31tRai7j2SSVNcUbOPlYvqkWJMb8jlpqH3oUV1arMH0Gpk4509fs47F1Al0d/j5Ddc8NDSNoc=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TY2PR01MB4361.jpnprd01.prod.outlook.com (2603:1096:404:10d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Mon, 19 Jul
 2021 05:19:17 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0%3]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 05:19:17 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Leo Liang <ycliang@andestech.com>
Thread-Topic: [LTP][PATCH v3, 1/2] lib/tst_test.sh: Make tst_umount work with
 argument that has trailing slash
Thread-Index: AQHXeksy/aUA5f4WEkm0AYWVHABozKtJxryA
Date: Mon, 19 Jul 2021 05:19:17 +0000
Message-ID: <60F50B67.4000807@fujitsu.com>
References: <20210716140142.GA7113@andestech.com>
In-Reply-To: <20210716140142.GA7113@andestech.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: andestech.com; dkim=none (message not signed)
 header.d=none;andestech.com; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e82ea6a1-c6d1-4984-c31b-08d94a74c1d1
x-ms-traffictypediagnostic: TY2PR01MB4361:
x-microsoft-antispam-prvs: <TY2PR01MB43614CC721A748E935A7E1A3FDE19@TY2PR01MB4361.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1824;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ddtSsCh/if/y+1sRchpQ3Np4dOf8iiTJ1SX1KKU9iXShrea1zLdfnAWqJ2l54xNBr1jFygQtNWV9LG6Ekr9xsW7CUHDEjNLOWIS2TEohTSiVVn3x0uLNjWyUKSexcBnNRmWCjBoQX7oa1u4k9gtxhiT+UkcPfxiut4nHqynMrvFZ+CJJpXS96twi6WWhgEvQZCqjqK9ESOQzekLkhLkRHzCzDjmp8TkMix/D1GwqsjMeTMAugSGoY+5/qV6e4OGzgFuT2a3fSdyYjRzVbx2uo4fB0imWSMtoUG4KuxhFsfPlETgBol10+d6qQm7AWvdqlsXHIWLepJrEea26fbXo7rYiFGZ1Es7yaXOVTVbJloUyIM4R027nZklP/AjT49R4qYMkebgJHI0OZFi/7nLO6Tyyz//iRK/49Z8OSYTj1YLtP/UrLzW1XpU4PVxuGGzziT0b9v3r9nG7yiuTqLDXPDOl9naySZHF2a1WvDxvhHYYi3oSzEO8UsYl0jQ+1wHUhhvNIt8FVR6XLsRDHxI85DArZLunz+pPtXejsjUZLU/LtJ/A9QrD+o2VtzDhCIeV6DwlP7kMtEMJRr8TxSRdpDJqdhkpt+elQIwjNpxwucWXU9E0UrkjLxlTGltG6wsSnZYGCn/LNOCgTN2FByflSMDJpeamORsNimzm8IxTZh7eaUE7dSR61SoxxpKWltOjf6GNDOeM1MQTsmBM0odjBqsZmymqUnjjjZK9EsKHrgk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(6506007)(186003)(2906002)(2616005)(91956017)(76116006)(8936002)(6486002)(38100700002)(5660300002)(26005)(122000001)(83380400001)(87266011)(86362001)(71200400001)(36756003)(316002)(66446008)(4326008)(6512007)(33656002)(8676002)(85182001)(64756008)(66476007)(66946007)(66556008)(478600001)(54906003)(6916009)(21314003)(38070700004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?NW1kQ2w1VUx5Sm8wV1VnSGtlc0taY0VNRGRSNUd5akxmckZEd0s5UjN1RDVs?=
 =?gb2312?B?TzUzQUhBd1pQRVVDbmc5R3NhTk5lVjhrN1JEdnhBV3pmNUZ3UjUvR0Rsb0Zk?=
 =?gb2312?B?eEJnSkZURWNtV1hjaXloazJ2QmhSS012dFcwNzluU3paOEhsUlFvQ0tSV3FE?=
 =?gb2312?B?WUlOWmt5cE01emRPS0trVDlBMkpZUmFzWldoTTVyZTBLNFREQmVxRzArcU03?=
 =?gb2312?B?U2lkWWc1OEN3dlVYYTFSbGE0NTYwVUFTTmdGeUtJT0VFT3NXcTlxS2FnQWFI?=
 =?gb2312?B?aWUrS21OSzB0Qm0wVytiMERvNmg2c0h2UFlaZk5MalZjMUV2WEpGMG4zMFpT?=
 =?gb2312?B?OHF6RFByOHM0bENTRGNvcThndkxGek5GT2l4bFFMRE9DaTdqdnZWSTFYa1FV?=
 =?gb2312?B?UG9Gc3FiSjM1UytyQkhXRkh2RTNxcEduSmxraGhXSmtodXNGYjFNL01tczhY?=
 =?gb2312?B?d1hCZEQ0anNSTVhSS2lsdFk2SXd1eG43cW5abDlrakQ2d3Urd0Zlb1RNNGxn?=
 =?gb2312?B?OGp3bTR3YUNpZHptMUZGZkRQbUNubXBKTjhFa3VXU2NCQ01va2dHNTlQSmJx?=
 =?gb2312?B?OFY2TXkxTXZpSXZqU3dSaks4di9TSy85T1R2OTEwb0c2Wmd1SEFlRVN6Mk9U?=
 =?gb2312?B?MlVURGhXcGlxNm1kSmFwcnVYUGc0US9LQ0sxTVRWLzd5RDZBUzArdnZxbnFH?=
 =?gb2312?B?Y2xYVkZucUt0cHpNVlUxaUNyNCt2SGIzbHNiMzE2RHpvNkZKa2YzSy9VVTRQ?=
 =?gb2312?B?SmVJaWhhamczWlR4T1pKZ25rQTdLWENUckJnc2x0R0U0eENmT2hIQnk3Wkhh?=
 =?gb2312?B?N2hHR1dNaWQ0a2F3U1U3SnhmSFVPR3pGcjJRZzJ4V011T0xkdGdpcHc4aWdq?=
 =?gb2312?B?R0UzR0V2Rk15enZQa3NvUDY5VEQrTnNtbGZTNFd0ckRNQmN1WHU5blIyekZN?=
 =?gb2312?B?YWpCanBYbWwvbzBITWdmaU0zend4c0VwYU9MaExYV1czcFpPWko3cmNKSHRv?=
 =?gb2312?B?SGtQbTBEYitZTEhhZmhUSnJvT2E5OXcrUnA4ckZDNUkwZnlodFJicURXZCtP?=
 =?gb2312?B?YVZIWndYTjhRaVYxeGowUXBHUzF5N0Y0bjFBVHBCL3hPQTAzaFFURWo0RHFG?=
 =?gb2312?B?TmYzTFVWREFaNEtkNkZSeXh2cGhjMmtoMUIxQTRDRE1FSHZhTTlzNjN2czJT?=
 =?gb2312?B?ZHlpL2J1NkhBdU81QjJGV0JOVkVRNjBpRkFtOTBCdS9SU2J6RHRZUGllL1lr?=
 =?gb2312?B?Y0U3c0dzZnBYRWwzQVZlMFlvdU5tVVRpUjBnTmR6MEthamVIeENrTkgwYkFT?=
 =?gb2312?B?YitnZFhlRjhIYXpmbmROeFZuWmxsbEIrMFpNMVFxb25zN2ZaaTJVeEJzRWI5?=
 =?gb2312?B?bUpXL3dzZ0gyU3V0bk83N2dwSDhOZFZOK3l0V1ZrVUZiMTRoL2JiVWF1UEpv?=
 =?gb2312?B?MTE1b0daeDhwRUtXNE9hNWNidVhmV08wcU1TU2tZZWxXNlFNVEZzeENScElC?=
 =?gb2312?B?T0VMK1dmUStoV1RUSkYxUzQ4V1hYRGN4TlVSSWEyZU5vL3RDd3lzbXQ3OHFN?=
 =?gb2312?B?akQrb0ZYVi84VWRRZnh1WW5FZWVUeTJ4d29RejZNZS9RY2h5djNCRUxYN1Nr?=
 =?gb2312?B?cHU4WEhEaSsvc3FxbVRoaFg1dVRDNVJnbzRGcGNEL0tEL0dUMWlicTRDTElp?=
 =?gb2312?B?cFYyakt5dlVkR1dySHNST1ZkazM0QW9XRDM2SVRuLzZzRGdVcytycTNrNjNl?=
 =?gb2312?Q?ZMiPXwuq+NlucXSYso7l5SnsWI/sIgFZCOcrE1U?=
x-ms-exchange-transport-forked: True
Content-ID: <954A71BC06293A48A9CB14B2F4DD3399@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e82ea6a1-c6d1-4984-c31b-08d94a74c1d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2021 05:19:17.7728 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: debPs0dsVmqUcJDfmFTQXiBAyaQC+6OQFRPF0mjUVzDen4SjlEGGByEqWBN9sEAlWWAkT7iiDFdcJX+BjtY4JZtEhlLq7UVqKihiNps2UBw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4361
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3,
 1/2] lib/tst_test.sh: Make tst_umount work with argument that has
 trailing slash
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

> /proc/mounts shows the mount point without trailing slashes, e.g.
> ~ $ cat /proc/mounts
> xxx /root/cgroup cgroup rw,relatime,cpu 0 0
>
> So current tst_umount would not work with argument that has trailing slash, e.g.
> tst_umount cgroup/ would give "The device is not mounted".
>
> Fix this by filtering out the trailing slash before grepping /proc/mounts.
>
> Signed-off-by: Leo Yu-Chi Liang<ycliang@andestech.com>
> ---
>   testcases/lib/tst_test.sh | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
> index c6aa2c487..f132512e7 100644
> --- a/testcases/lib/tst_test.sh
> +++ b/testcases/lib/tst_test.sh
> @@ -282,13 +282,14 @@ tst_umount()
>
>   	[ -z "$device" ]&&  return
>
> +	device=${device%/}
>   	if ! grep -q "$device" /proc/mounts; then
>   		tst_res TINFO "The $device is not mounted, skipping umount"
>   		return
>   	fi
>
>   	while [ "$i" -lt 50 ]; do
> -		if umount "$device">  /dev/null; then
> +		if umount "$device"/>  /dev/null; then
With removing this(we don't need add "/" here), this patch looks good to me
Reviewed-by: Yang Xu <xuyang2018.jy@fujitsu.com>
>   			return
>   		fi
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
