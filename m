Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B793186C1
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Feb 2021 10:19:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ABDB43C5DE2
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Feb 2021 10:19:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 63A213C62AD
 for <ltp@lists.linux.it>; Tue,  9 Feb 2021 15:37:14 +0100 (CET)
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 371F52001A0
 for <ltp@lists.linux.it>; Tue,  9 Feb 2021 15:37:13 +0100 (CET)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 119EUE1g041615
 for <ltp@lists.linux.it>; Tue, 9 Feb 2021 14:37:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=corp-2020-01-29;
 bh=sBG5lBjUZwJVl7MLAfVkt6Z+K0K/2p00kohRS9EJij0=;
 b=fbHJsd4o9LgWSc1sQE4Z0UADZFu41XlwYwFQC+COfGkVKJHOV6lHkeKD+ApG8t3adkfn
 UQT6BOK1OABi0ifdmH4nWUpvHXQvW6wEHhnnQxep3g89jgLn0OStCF/CV/Vi98w0Pz4k
 yAT2HbYFxQ3hO6JGYc3LukRDuDptzV+ql4ttv4FxeMhu7jGABlhTsbOdeevPujPSNX2v
 Ho4lu/El6VWV3MOE8Gxd7gEKhMxPwl/LakqIXLNIAHOIZecOu496HRtgpS5mgj16OMOp
 oxxs4X+6d77Mg4SloCOYuuzehB2hqaCXIMNOX+j2GCnOzbEBBvYv7v0nkOhRhtvbycO8 cA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 36hgmafsqv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Tue, 09 Feb 2021 14:37:10 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 119EUhmN010965
 for <ltp@lists.linux.it>; Tue, 9 Feb 2021 14:37:09 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
 by userp3020.oracle.com with ESMTP id 36j4vrd76u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Tue, 09 Feb 2021 14:37:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zpx4I6UeI6i9c1t+lztpm4g+L8gUHTUm0P1y3P7jFFhiRANx+UElY3exUOY8ajxwrZpldVf8CYfic2s3zcb13Y+AnsvoB6uvAGux720NjbqroaLGczeIsNUBg2V7wSCC9it/gICyK+0oYZDd73gsWrP7AihM/JELRZ4bizI9XdhoQ9T95YY6r8gXH+/55rE+i4RB1cbFGqT+TVFjMl5FTJ3E/c3r5oM/x5Cvztb/mWz0S94vD4TCJ3QfsiHi5er0rfouiKPTOHDCQNe9hawCfKPctCfN5+1kA8Pv7IkilLeZnB7JPVLOa2p4XpmiIDQr7qem4P/XDozZyeXAai55FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sBG5lBjUZwJVl7MLAfVkt6Z+K0K/2p00kohRS9EJij0=;
 b=Nw5hZFHoPnZTPGqrVNsyP9fVeiMD97ZAdKHyjWSpkUQvxY8h5o13Bx45fJcSOnzTwPDRHh/U5BsQBXm+1wIszeXmN1t0bOmal41ZqDlxiA69bSskQcyKNto79+H+pT59FLplHFGj2hhATIZ+jovhblnEcT6cyyob0bMv6H7+USiidOBQXJj0i4yTVhb9vG2AeYoIuW9c/Z9zymWloq1CidNHi/wrHVQC9LnmVBybLKRaWu0XKeL4hLCbzfaUrFQEGEQxpnIdF5gHZ17oxhzc8Q2HWM41jmpw4M9EXr87uulYaLqKR1okr7/VpNJMPQJSEJaIuY6FUu6OprMgSY+DGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sBG5lBjUZwJVl7MLAfVkt6Z+K0K/2p00kohRS9EJij0=;
 b=f6GLHkqt+7igO5tnCY9tN9Wd0BlnVKCSwB8HoKYqqaUsziTOgdi6ibqoBVLNcRWGcUxs6p4nN76rhKO1gZ+8A6B38v0Tr8dcfqau9Ya1UAKJS3EpSg+zhamhJNJTwQ3B5SJBAEOy8iPCgLTqB6odR0F/J8M4jRmQ3h8d608ITiI=
Received: from MWHPR10MB1582.namprd10.prod.outlook.com (2603:10b6:300:22::8)
 by MWHPR1001MB2126.namprd10.prod.outlook.com (2603:10b6:301:30::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Tue, 9 Feb
 2021 14:37:04 +0000
Received: from MWHPR10MB1582.namprd10.prod.outlook.com
 ([fe80::cd32:6bce:ab18:83a]) by MWHPR10MB1582.namprd10.prod.outlook.com
 ([fe80::cd32:6bce:ab18:83a%8]) with mapi id 15.20.3825.030; Tue, 9 Feb 2021
 14:37:04 +0000
From: Liam Howlett <liam.howlett@oracle.com>
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: [PATCH 0/1] Test brk vma code path
Thread-Index: AQHW/vEJhAxZCY17qkOj4bjt/j+Cvw==
Date: Tue, 9 Feb 2021 14:37:04 +0000
Message-ID: <20210209143702.2003038-1-Liam.Howlett@Oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=oracle.com;
x-originating-ip: [23.233.25.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ce9f33c-7187-4f00-dbd9-08d8cd082bac
x-ms-traffictypediagnostic: MWHPR1001MB2126:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR1001MB212684695459FC9851F1E627FD8E9@MWHPR1001MB2126.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 64jCceqQPfXIYrEiGArUWGaycXiZwKRUhQnVSIM6x5J8GjHH41Ev1Mw7X+O4b++F45g9ryH6gaDnRa4W845HipdEHrPh4JZwcdfVIWR+NHaYrf/sExfMsVzBmbgRZZc7EpyMwjB/rxZUN2vpSPpcXdc26n36VVpioDWO+LrtB4xhCdCdrnBrbpMiCW1w5Vp95XxnOV+cmRkTZBPYE6af2q2KtHHREOeAHx89qO5ichSMtxZZdBcYKFkX2iqorX2lWkYjwpJScaPepAgd5LU2PVSkXvmaSzfsMQadmKWuJQKsia4EeUni6on0MGcFmKQLMh5bVcg1j+IrqJTS0nLGpxCDv8mmuM9tXAFJwwoANM7k2Sb0MOUu+ke+MAZ50jRHO21a1rN/AL/x3hmBSmmKc9CPtu+tZ7tPK71SOLag6QlHb2o3j1jkqoFPCqqb4215j5QH1sxBxk6EFC3AY2ONUNc+6vaQ9+XxvZRyAwbYkLbLjQnuqmszAiSZ6ygYq9xaLkcD3XcQX7dahtqrbryXew==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR10MB1582.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(376002)(366004)(346002)(39860400002)(396003)(478600001)(2616005)(6486002)(316002)(6916009)(4326008)(186003)(36756003)(66476007)(2906002)(64756008)(66556008)(66446008)(4744005)(6512007)(66946007)(76116006)(91956017)(71200400001)(44832011)(1076003)(107886003)(8936002)(86362001)(6506007)(5660300002)(8676002)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?h4k3aOx8reYAi5t0mnOvpIYYacyt4GtjzgKwRHtMXqKtY8Qh2U0Q7BX3sL?=
 =?iso-8859-1?Q?uOaLkxixoqkUBwSzXYIhFkUC22LNxa3IrgE6NZYPuqu/WTJGQMueOauvk6?=
 =?iso-8859-1?Q?UjEouBskujrqNWwJ5DFbzv3POENBqO+oN+hk1C41vz9a5t0+YLBIduH/pc?=
 =?iso-8859-1?Q?jnYjlgDtdcmlNkAB584ktlid2/tFXW6O/JxsQJjqFbZbC/cnB/qc/FnvGM?=
 =?iso-8859-1?Q?mQn8bTZDFIGEcxbYRKME3A2t/baaEv1Uyv/7DeG2KaB0M9t/TorN0n2lYn?=
 =?iso-8859-1?Q?4mriWAgmFQLkGxJ7vWD25Gne90UOI0U/SyMSCA/JftBgjXeaMj/AlF3NsG?=
 =?iso-8859-1?Q?gI6u6CsoX0WLFA1bGero8iglDd6VgZ/HAkBDBc9JbcFmYRvP48zFEFqV50?=
 =?iso-8859-1?Q?Fy6waQJIC4j6rz1NEOMb30Xsc0bMK+naYi0oUewJynYHdZFvaS8oR2uWXX?=
 =?iso-8859-1?Q?/V+CExem+bZQGlBTHyn0lhMmZIt9Ox6hYx5h40bBMCAjnU03NEdcHutkpf?=
 =?iso-8859-1?Q?nY+zNjrXEf0eEHWoP5qHdBxLTMaU9yMkVf/a4AnjZ/lBOFqhqP5TO3uR59?=
 =?iso-8859-1?Q?9TnbcrJGnCuHOW3pARXS1w1NXS5d+GH0RxCKK54fC7S2m3ph6ZMqyJzevl?=
 =?iso-8859-1?Q?gAEt8K4reRb5snN8MAANTSWrAYlqPqr2KAVwgHXVKDcJ68ZlsrSgX1SLTO?=
 =?iso-8859-1?Q?BuXCHmdVID4Jb4T4Ri3Ixs7FPZ+cPO8Y0fZqJH06+r5C5eo0Jkrq3nRgak?=
 =?iso-8859-1?Q?+MnQ+N1aOBMQ/KjJ5xZrG7WrKvX4lCnFO/AujCQZSTI5e0xviQC1kU8bGa?=
 =?iso-8859-1?Q?P7c/hMDzJY8RnjADp2qVL2m15zvX6uOObodFaGBhK2EC7vjub1Uk2j3HGy?=
 =?iso-8859-1?Q?/dP9gXNgPsVZAgHMcuovm817mM2WHYBue5ZuTFqlOUR1r1FuzJENQmBOG2?=
 =?iso-8859-1?Q?5OqRkPGXvepYscox9eP64Yl8cSiMiR3WJ6hDadl+1WAtk7uA2jLLLhnk68?=
 =?iso-8859-1?Q?XDbSNpcPcdNTmIQBdqbzMfEgt4IqIVSdOICscxdT+vRRwaIXdcb2lJOxZT?=
 =?iso-8859-1?Q?igSxtrWwj4AFMKgKvzMcbO9gxRH4OnEBzJp4wh9atpBYOmpcwAQy1BO8xI?=
 =?iso-8859-1?Q?B8/2R9ns/YMYKJY3XI7j+SmvwlRAnDhiNEtUQR5FqiNLoIsYr3A5eyUuWf?=
 =?iso-8859-1?Q?eBFqpRkeLU44zh94q3U6Lf5rgEhKvDpcaWYSqyB+2B/mK31OW5nlCTyj5Z?=
 =?iso-8859-1?Q?SZFKGfaWurPIXl/h+BEIXZ5w1J0EUZQ+i2hgImcNP17PYezKlv08HN+35S?=
 =?iso-8859-1?Q?udg7DhuKnysX/cRGGmc6f5Orre6A5gc4hWGLLurz7DjV7RdjEHZCt7JaGq?=
 =?iso-8859-1?Q?BRwAhwaQEp?=
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR10MB1582.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ce9f33c-7187-4f00-dbd9-08d8cd082bac
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2021 14:37:04.7886 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8ZCKSF2I5qKk9DTYMO9UZlF2bzdRY8IpXhYOhclHE+BXBI6C6Plu5QpTe2LnLfUCisjSl++v+N13QyMhJLxvvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2126
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9889
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0
 mlxlogscore=954 mlxscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102090075
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9889
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 mlxscore=0 clxscore=1011 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102090075
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
X-Mailman-Approved-At: Thu, 11 Feb 2021 10:19:09 +0100
Subject: [LTP] [PATCH 0/1] Test brk vma code path
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
Cc: Liam Howlett <liam.howlett@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The brk system call uses a slightly different code path through the
kernel to expand/contract across VMAs.  This new test is written to
force the VMA to create a two new entries and shrink back across VMA
boundaries.

Liam R. Howlett (1):
  brk02: Add test for removing more than one VMA

 testcases/kernel/syscalls/brk/brk02.c | 49 +++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 testcases/kernel/syscalls/brk/brk02.c

-- 
2.28.0

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
