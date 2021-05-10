Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DAC3779AD
	for <lists+linux-ltp@lfdr.de>; Mon, 10 May 2021 03:16:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 604173C61CB
	for <lists+linux-ltp@lfdr.de>; Mon, 10 May 2021 03:16:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D649C3C1C5B
 for <ltp@lists.linux.it>; Mon, 10 May 2021 03:16:01 +0200 (CEST)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 8C299600747
 for <ltp@lists.linux.it>; Mon, 10 May 2021 03:16:00 +0200 (CEST)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14A1Dxj6032874;
 Mon, 10 May 2021 01:15:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=2FHg6YSI69RoUACuMVXsgxiHo4o7aYC7wglXX4IXH/g=;
 b=qdllQpPnLNsUgnBO+MtBCFLkoOi05q3Y+CJtdT3NvH9sVJ6nCrGf2Ws94aNZdIQPBxlR
 CCJF2cm+i9my2waEUeSMynvCwRXSLDZnjTnU9Jbbhn4D+cA/405mtD+A8sCywiU2ci04
 8YgrjXLjvuLxb6m4j0qvCGenq1x8pbUGysLB9L2Qq4908fA9mJMU+iJXxa1STN7TV1Cr
 41jTx4kSkfRVn7unp8lWM4NcoMOuDrRm7sbKuVxjyhcdIFVjJfx8LVNhXq9/2eLN2+aM
 Y2ijkSONiKUIAZnpm0mnk4Az1elogRnGVppDMcarwAtdH1mk2CBqWew7OQV5GUExp8vF fQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 38e2858w2d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 May 2021 01:15:56 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14A1FstH020001;
 Mon, 10 May 2021 01:15:55 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
 by userp3020.oracle.com with ESMTP id 38e4drc91r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 May 2021 01:15:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YPbSPTZKaipAJ/UyKGhb9uXSHsjIuydQ802sWyzTJan0uww1yAW6+c8vc0N6Z5HgEfxKxQXv4Bj+8AdSYlav7G7aHLOGo0HsrU1jDSTG4A+6zKS3Z83cObHhwDp53hXowb/ehYOLAnZuM9WRBSfoX3n21Dae1z/vhD2giPaGT8e9rGajnGkMwL6TrIXEvcdbVavpFEHzbjmt24JCOrRY2t3b044JtgE8euAxZBAMsKTkjLvSBfQ4hmXiB/R5JrPDLCHeITjDQv5oA781dCz/pKw3Ar4QTbeULTjccX995WIQKKc/d8ZQ8F14w7M2tKHMYyIe4BIMjVbm1mlvfgGE+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2FHg6YSI69RoUACuMVXsgxiHo4o7aYC7wglXX4IXH/g=;
 b=UbRzjBLdIKzMiIdFDFA7Io4jGsgsrfpAmx6XEcQfxlGzHkmvC4iUUFU6/cL2tZ6l8CHIeOuVqFzfmGeU3zescddQUeJtSPVoD4D45mCexT7Sq9FC0q9TIB4S3OmdvqZm9B3j58rdtFFb1HpavTrGUIAEwngsoZYDy1oeTHmqTnC527D35nFS0wEIT6q9eHkw9+ersHWYwQiiArBupHkqYWMG6wWnx8RsYdr7OllsNX59dnXaTKH6cbeEy6F3ewoYN+tbWMF/gTMjnjn4LKSTCFQlsKgPNlW6UpruaJuYmO44qHM0bLjco48ohWvu48177K/yYcG9/+6F95FUmsBpTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2FHg6YSI69RoUACuMVXsgxiHo4o7aYC7wglXX4IXH/g=;
 b=RJ0rNrWew+tCc1BjN3Fvj3DE72F+svtp9I4ObgAqoQDlNcrVVM4otZtP2HSlOn+zHDq8ZGhBl6rR50c71/P7nJb+JtM9zdmaXUpLqxVRtsdbMnXrILzfYMTAy/edJpkBCtxttN7kj6tc+G1F6yqXDghi8O/+cDo59EOmlHmPiPg=
Received: from MWHPR10MB1582.namprd10.prod.outlook.com (2603:10b6:300:22::8)
 by CO1PR10MB4545.namprd10.prod.outlook.com (2603:10b6:303:9a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Mon, 10 May
 2021 01:15:49 +0000
Received: from MWHPR10MB1582.namprd10.prod.outlook.com
 ([fe80::353a:1802:6e91:1811]) by MWHPR10MB1582.namprd10.prod.outlook.com
 ([fe80::353a:1802:6e91:1811%8]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 01:15:49 +0000
From: Liam Howlett <liam.howlett@oracle.com>
To: Li Wang <liwang@redhat.com>
Thread-Topic: [PATCH] syscall: remove PROT_WRITE|PROT_EXEC from brk02
Thread-Index: AQHXQ9E1akQY1pUtOEKdyzh/IAfWTqrb7F0A
Date: Mon, 10 May 2021 01:15:49 +0000
Message-ID: <20210510011134.cegvehhbuyc5us24@revolver>
References: <20210508061252.18337-1-liwang@redhat.com>
In-Reply-To: <20210508061252.18337-1-liwang@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-originating-ip: [23.233.25.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 06409ace-7538-41b1-2217-08d91351258c
x-ms-traffictypediagnostic: CO1PR10MB4545:
x-microsoft-antispam-prvs: <CO1PR10MB4545ED478EF3DE1BE1291ED0FD549@CO1PR10MB4545.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OHbJyVIns83Z5K9qKZIS8b4oLeWwiku9wLQF5h8C9F3zxSM62pimhlx2StE4n1+vLtyuQ2PBLYarwwNEC/vZ0XS10L/f7kAZX1LqChTnFuBQMYsurgN9Vf+z0BTTxO/kB9FPtwQ/9oxJ9SIGktmaIaCF25v/qApYYOXDB1Nx1vEvWizDzNiqjpH1XYRlVKShk0k+YV87bei83GBTEGRiHrOueDMjU5dsSsYlP1EPpUHWe2FrsO54IZxVa0mhirPERKvzqcVJo6oBBvLU8Soaa433KmoFtaoMLTG4siPc2pIfB4aVvHkLVFaR8C69tHUH6ZHADQKhRnbgTDnLn5GtUPJgc626aH7Tjbe6g/pCq4/34uzyhx0x02WKWgN6iS4Qg8Q9DxNwMbwcWlfIQsngo3zoCVGdN2r8f+BEQucb80getVbS6nISK7q+A4IbIYgaFG9FHuPT2Qbpl6kzC6cTcz+S0af4OkF0RRTCklqFT4t+uckvn2veIZPBwFgw+VwJDgyzdnPRhCGgnpo4ZFTkLf+BgeDbazWJ4llxuIDINg7PS8wRAcv+PYzW7EtaOsfqve70BPdWc4va98vfVat8vqExloSjPUK8X5FD7tyyAfN6DPSs2C6VTw3EZdEcqqsGl3asN20JJ0BEJdEAKDQYcA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR10MB1582.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(39860400002)(346002)(136003)(396003)(366004)(376002)(6506007)(71200400001)(44832011)(122000001)(26005)(8936002)(6486002)(2906002)(38100700002)(316002)(66446008)(54906003)(6512007)(9686003)(1076003)(8676002)(86362001)(4326008)(478600001)(5660300002)(6916009)(83380400001)(66946007)(76116006)(91956017)(186003)(66476007)(66556008)(64756008)(33716001)(83133001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?8VyXsa1wN8PpiBcCDMdNyff+SgOizpQ9rElnyQVpZ4p6nyc5VRFS1ovI/ofn?=
 =?us-ascii?Q?tgckveu05b60mS2W6VxTja+4ggcswmrbOeMWpwgNNyHOkEEP8oTBmZo6YfPs?=
 =?us-ascii?Q?YL+VVTqZ7Q6+LKF4qi7qkLZkyDn1KFDIiG7CzIqGRyRCXknz2gBUAr55lvvO?=
 =?us-ascii?Q?dZKX2NtNtMHGuu6PM+6Ir1UuJvGfGTZ4mac63P3F6Q1G0XF6Ci6E6xltFtNp?=
 =?us-ascii?Q?MfzxFZs8/vD3YnrJrCrMB0HoWiQaVvwRbF7v7wIS57nRJyG/I/HXeikeYCd2?=
 =?us-ascii?Q?Zw4s4fIW1fSAm8AjveIs/352pXsYs/U5iP8LyV23coveygcAQfo9TyRksPed?=
 =?us-ascii?Q?oO3nYKj8ptAxB+atu2+ivnXmxthrR1h4pzW3/Kb6DTISCxUI4dF5eXJ2PvM4?=
 =?us-ascii?Q?o7HBf1xpDfFZZ3me5f6/xIXNxj7/VFRUJ3EPbipKAxT89KsX8K951hzterht?=
 =?us-ascii?Q?murBNSED871yWaLyOFDtvGrBIxHvbYTpvrbY2XRXe4mqpoRl+uoZakOR9eOe?=
 =?us-ascii?Q?BUrQKV4uEHSkS243lOVXYAcl/lRFNxr1ztm9JBh39VHFtjbSVJAhE5QGvn06?=
 =?us-ascii?Q?cIF0Yl97qVCgiqGgkQ9QWavJ32lmp+QOPJIwT72RV+3rK68uaxygDCx/KFOw?=
 =?us-ascii?Q?BDa3rgiW38PajWaQOCG8P1Tagvxn4bSkldXduSU2lNTK4ROW7BnKtP3Nrxss?=
 =?us-ascii?Q?qzejgSY3UIfKhiTZi5u8lmg0l6G19UlUglP25si/VU7Bm/GOVdlfEmvhTb7a?=
 =?us-ascii?Q?a1WPhLOD3Y0wpkeTbkvVfkn0hjeLcgGWorqnZrxdOZoAMoSzTKlvCuRrH194?=
 =?us-ascii?Q?MynOifpbqkhssNBJmy+9O866dePJ9uJjTr68eqlT0rvyZJ1h2MUmygfiNH49?=
 =?us-ascii?Q?5tmXJaz0DDUokYoOJRcq0105f3WPdi5o3F749Ao9LNZdKX4tcb+kpsT+WOzO?=
 =?us-ascii?Q?4G3LRYnlEO2MrOdF9kz5PMqOuB1+jMgYFvLq8suicVnE5RGNs+WXRmT8N6QZ?=
 =?us-ascii?Q?n6hbGojhLZtZLBiAywvgYeBd+rw97T0SYhP2Fjz2OJmCYb0fcZeRJq6VoZtZ?=
 =?us-ascii?Q?wPUzIYZ+7I8CdcXyXLSc9IE/53jhxg/5fRHpFhCE2MhC6w6OvdqV4OvMiNAg?=
 =?us-ascii?Q?Jzan9ywCBTiJwXUs1W35O7Q45LFTN9LUiQPucYzJjJ/so+rQrQiKXDbbyKgy?=
 =?us-ascii?Q?UWeKoEAvWmQwnogrkM7epSqw+o9sL9B7M02VywOA8S8mo5bX/0q+eDv703l/?=
 =?us-ascii?Q?qCFf7HXZnUFJwVGtNjWme9YwC3OfJFax2aCs9MzhTXLtLS8ArVUThJtnT88s?=
 =?us-ascii?Q?2DYxEzPsLa8OXriTHnOBLozW?=
x-ms-exchange-transport-forked: True
Content-ID: <075C712B929BD845B83036FCE99759DD@namprd10.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR10MB1582.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06409ace-7538-41b1-2217-08d91351258c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2021 01:15:49.2015 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4Y7aqtMFtYVQoSoLODJys6yki+p96kdEbKY1ix5/+fFR+8kza7kGzemiMBAZ+CUQvcdNqdsWftc0VTL7Wuy78w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4545
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9979
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105100005
X-Proofpoint-GUID: GDpLUt9a_kOCUcaiDzy4SeV8SSH0UzmS
X-Proofpoint-ORIG-GUID: GDpLUt9a_kOCUcaiDzy4SeV8SSH0UzmS
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9979
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999
 mlxscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 clxscore=1011 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105100005
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscall: remove PROT_WRITE|PROT_EXEC from brk02
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

Reviewed-by: Liam R. Howlett <Liam.Howlett@Oracle.com>

* Li Wang <liwang@redhat.com> [210508 02:13]:
> We got permission denied while performing the brk02 on x86_64/s390x
> (kernel-4.18). After looking at the manual page of mprotect(), seems
> the access issue caused by PROT_EXEC.
> 
>  " POSIX says that the behavior of mprotect() is unspecified if it is
>  applied to a region of memory that was not obtained via mmap(2). "
> 
>  # ./brk02
>  tst_test.c:1291: TINFO: Timeout per run is 0h 05m 00s
>  brk02.c:41: TFAIL: Cannot mprotect new VMA
> 
> From Liam Howlett:
>  Just removing the PROT_EXEC invalidates the test. However, if both
>  PROT_EXEC and PROT_WRITE are removed, then the test still does what
>  is intended.
> 
> So let's remove 'PROT_WRITE|PROT_EXEC' to make brk02 PASS with
> all platforms.
> 
> Suggested-by: Liam Howlett <liam.howlett@oracle.com>
> Signed-off-by: Li Wang <liwang@redhat.com>
> Cc: Cyril Hrubis <chrubis@suse.cz>
> ---
>  testcases/kernel/syscalls/brk/brk02.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/brk/brk02.c b/testcases/kernel/syscalls/brk/brk02.c
> index 4a272bac3..11e803cb4 100644
> --- a/testcases/kernel/syscalls/brk/brk02.c
> +++ b/testcases/kernel/syscalls/brk/brk02.c
> @@ -36,8 +36,7 @@ void brk_down_vmas(void)
>  		return;
>  	}
>  
> -	if (mprotect(addr - page_size, page_size,
> -		     PROT_READ|PROT_WRITE|PROT_EXEC)) {
> +	if (mprotect(addr - page_size, page_size, PROT_READ)) {
>  		tst_res(TFAIL | TERRNO, "Cannot mprotect new VMA");
>  		return;
>  	}
> -- 
> 2.30.2
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
