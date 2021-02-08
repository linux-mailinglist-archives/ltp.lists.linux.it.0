Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D290431373D
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Feb 2021 16:24:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9A5EC3C69A0
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Feb 2021 16:24:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 1FA283C5E4E
 for <ltp@lists.linux.it>; Mon,  8 Feb 2021 16:24:24 +0100 (CET)
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 25A091000951
 for <ltp@lists.linux.it>; Mon,  8 Feb 2021 16:24:22 +0100 (CET)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 118F9pvh067638;
 Mon, 8 Feb 2021 15:24:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=rfSHJvTqabI1TwSp2a2j2q7JKuoYtDS5+lMzurRXqDM=;
 b=YwXrsmulzKAmzt0/+3o1r75G+HjfvGrFjjWyC0nLiHi9j42nCss74/MYUx8qFh3+NcHx
 MY7DGNiKqfWnNplX2WNWXy48OtP/Ff0TJbwHQ2zBrKuSDuIhkZNZPZSBDUSZWXuW0RaO
 1lq5N4rIue0gh4RUwp7xfJcec7NNITzfNOJZamGbLqr27kJY38c6Aq7ouwvNQWMuUHSz
 bApIKGqfPXS/EDZCPa5tBQKT6HlNuX7xnCWePS/18xJ53fzcFVT4etXAFwOcBftR+Ybc
 vveGeJt/grWcVGHswuFx54Mw6HcRYNksTlL+ULgGaWPctDbZHZj4dH/3d8RFKiHPz2y8 Ag== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 36hgmacbyr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Feb 2021 15:24:20 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 118FAaHF088447;
 Mon, 8 Feb 2021 15:24:20 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 by userp3020.oracle.com with ESMTP id 36j4vq1g34-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Feb 2021 15:24:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JJjMEqB9qNKcPN4osQwjfE4+qcj4WbKY2bpotTxriyvHvMqLTvNXOCMHW11mxXukH3AQejqJePzgQl0i3WIUesyvgx0VGdH8WK2qa0qKbQY2wodYZsNdX46HXJSPDStFCgEBo73H+qkzJNTokux4BxJtC/6YcwHU3cwofC6Nrh9gmWBgISrVLN9MftDdgKW9es5fDhwY/9SpY4W0gCek4S09+WWIKUgjQ3WJy5alrqcHC04HsR/524xYpU3IFCQ+WWaqM+NnhlInLtwCVU3T6OVhEhpqFqhoAvk2e0JldeNPvBfZl3gUAiQf3oUTNCxKkjwOjhrdH3tMBegdw9PjHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rfSHJvTqabI1TwSp2a2j2q7JKuoYtDS5+lMzurRXqDM=;
 b=h9woiTvOC98Mej3Y7iUUFENUAlzchkd7zOFqzQxdVIfdY8aEqMIzLMm+o4uxjJGcfrhIEqBQLrQVFp9huaQZT+xFr9ZDF73rU7t+v0z0kU98ch9A3sNX74LSBd0Vtusl3IKjXejwCZ+jOqJ1lDkybbdUs6GIM8XYZjgwAjP0EWacSS2my4qzfi1hR7uY2Q0sTWtm+aCfTzjp9xRVhpuWDtVcvHvvPKE7MCGdWFB1l1v9Dg6GE95d3QkJZYjgmYfXxD7pIyOU6v9nireuN9vapopuuJCgBJBSwTMDsViBIQS9FXTM019W+U8BeTyrRHSdzHi4r0Yn/ieI4DVVShKV0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rfSHJvTqabI1TwSp2a2j2q7JKuoYtDS5+lMzurRXqDM=;
 b=H6GwB3rjxYLVfhVdAua687L4FyigYl59xmW/P4wOO/BoAUpuRMviJ8Y/v8h5duzI+A1AVqC6oPwxdl8QLYmvFSKmaStpyngZQLxbnveVI7/FYzqG2+II0Q5G8Ug4cDA+8x1LmM2Se41n1EilSV73pSlpobaPBvyVhZEsEf2CDiU=
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3080.namprd10.prod.outlook.com (2603:10b6:a03:87::13)
 by SJ0PR10MB4528.namprd10.prod.outlook.com (2603:10b6:a03:2d4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Mon, 8 Feb
 2021 15:24:18 +0000
Received: from BYAPR10MB3080.namprd10.prod.outlook.com
 ([fe80::71bd:d013:6c98:9bd2]) by BYAPR10MB3080.namprd10.prod.outlook.com
 ([fe80::71bd:d013:6c98:9bd2%5]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 15:24:18 +0000
To: Petr Vorel <pvorel@suse.cz>
References: <20210202133454.59224-1-alexey.kodanev@oracle.com>
 <YB0cRKmBcO4qgLf8@pevik>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <07a6d0f9-6bbc-63ff-5401-ab2d6af04364@oracle.com>
Date: Mon, 8 Feb 2021 18:24:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <YB0cRKmBcO4qgLf8@pevik>
Content-Language: en-US
X-Originating-IP: [95.161.221.177]
X-ClientProxiedBy: AM0PR07CA0030.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::43) To BYAPR10MB3080.namprd10.prod.outlook.com
 (2603:10b6:a03:87::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.35] (95.161.221.177) by
 AM0PR07CA0030.eurprd07.prod.outlook.com (2603:10a6:208:ac::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.11 via Frontend Transport; Mon, 8 Feb 2021 15:24:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54d4bd09-1dda-418e-9d1f-08d8cc4599b1
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4528:
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4528F517686A63E1524FD53AFD8F9@SJ0PR10MB4528.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aeC6rWdQjjcysf4glaQPqXWSROZCb9dQZqjMMDaN1Dabh2G5DVx/iMux+Mksh5CaO1YufYbO/DWP/HuX8g0jddoP8u/uaOLuomk6fnNd4zCjFbQJoo8k81jvSLPsDTJb1S0Xa7ps8PdP9l6R1jbIbm/fo3fOGPkXvKS2ievP1nSfhs/btSmgFzY3YF/mKgrKOYm3T66VfkysGtkjnbKCv8WTU1PXE0qG8m0kbj97caslw/2b8THoMUXpIbSNFQtZlLmDarARzlHIROOGJ1TB51fc5AkGVN7a2V/lanc6UVmCpUGJVOIzLr0Dr3/tYTNaglF6ERCkV+krSaYs/Cw1a9jP8U4qkws2NCqd/493QudX9/Tg2xn1gQKJA8aXsZa4+2WvkpYBZJ5LG/ONrI7Z4Sog+/hy9S1bCIr32fT3YlGQfsv98gsnJxa/C5F4+jgawi7sLd/tLQy+0gwqcP7fAomvVh4L80YEol5HWr7M5uAW+srTLwbMO8FefLTiSi9z+2APvtEEPY+zSZI/TB/ZJwyxpfO7wf75MWeHxLTnLz/pLJvNhGKVrxqS8pwtRM4q9XtVuQ6f5/ni5LUSaM8qEgCD//qzQC9chzidlRmisP4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3080.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(346002)(396003)(376002)(39860400002)(478600001)(8676002)(86362001)(66946007)(31686004)(66476007)(66556008)(186003)(53546011)(16526019)(83380400001)(16576012)(4744005)(8936002)(44832011)(5660300002)(31696002)(4326008)(316002)(6916009)(2906002)(6486002)(6666004)(36756003)(26005)(956004)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dVVVVmdXT1pkWkduenBlL3FJMEQ3QlZ1QTdyVUI3Z1d5VlZCOGlYbTdBenpJ?=
 =?utf-8?B?MVV4TmlSVkw4SERJc2RSVk9Fc2NxbTNkY2xDdTUveEwyOEZpdUMybkFoVnZa?=
 =?utf-8?B?VytKK1V6MkRtNUJtaDh3V1NLMlplUDV4NlNOckVxK1JQNXVNbmFocW0wamJE?=
 =?utf-8?B?Y3BMeWpHNE03RTFkb1ZVVmpHYUFBOVpPVCtlbVJnTmxZVTd2cFNsM2dtSE52?=
 =?utf-8?B?bkpuaUhWMGErSVYvd0cyVG9RTU00OVoxdG5qWTlLODdzSnFFNDY2MlpJZTB5?=
 =?utf-8?B?bDYraWhUMEFESFBGdkZZb0Y0UnJwSW05a2pLYVRBT2grTU5veGpLb3hFSEJR?=
 =?utf-8?B?bWE2bnY5R2srYk8wU3V4K0V0c215bnF0SXdkdmJ1ZC9MYlcwUGVDOU9MT2tr?=
 =?utf-8?B?QTBnR29DSlJubzhSMFAxS3BZamQ3bmU2WHFwbGJ4TkFOT2RZaGFwLzBiSWV3?=
 =?utf-8?B?cGRzbURCRkx4eTZpTEVxR1pDM1ZJb2Y3Tlhza2Rzd21MbWpvSktLM1FOL3NI?=
 =?utf-8?B?OWhNcVJXZHFXN3Q4QVMvaWUvMU9BNzVrSXV5QktBekU0eGw2U1NIUk5kTUpr?=
 =?utf-8?B?Q2lpL05tdkxURzZzMzUwQ1MwYzZJelJpQ2ZIN0RvRmVPaytKbDhMbjM1ZG9u?=
 =?utf-8?B?NE4wZ3o0UkMyUllMQkxZdm9RNDhCcHROWmJ0dWc4OXozM1d3Z3U3ZldpZWwr?=
 =?utf-8?B?OURmeGwwSzdFbUhCdGRhaEVmNXBSV3lCQm9tTDJwV0RtMjFGaVl0OElMSjl1?=
 =?utf-8?B?ZStQQm1RNml0amc4SVBVM3VDTHFXMS91bUZUZ21oTFFVakdDOGt1RnZBRG1q?=
 =?utf-8?B?NHhVU08wV00xbVRBMU83WEowKytScDBkTy9vZ09lOWlsQlVxV3Qrd2NseUda?=
 =?utf-8?B?T1NCRjN0YTM4SHdMNm15V0JKa2Zid2srYzhrYk1RekNnMmM2NGc5R3hyYS84?=
 =?utf-8?B?VkE5dE5tUTYvK1JEWnAwNHBROHVJM3pSOGxIS3R5dysyeUhiUStRbkE0Tmph?=
 =?utf-8?B?M0xRb3ArQUFUSitvRllpOWllbXphcTRMRGhtTXZlRytseXdmRS9yeThzMnpU?=
 =?utf-8?B?VHFETTB4WmZ3U0lZajlRWEp0VzA5Z3dZMkJaamluVmhYaFRLRitKUVVBRFJS?=
 =?utf-8?B?ZkNBTGVpZ3ZZbndnbUEybmV1ME54N3NCK2hUUGZrZDJYTVQ3emJEelpkc3V5?=
 =?utf-8?B?VTBCWktHQmlBVHRjL0hLdWF4YXlrcldHN3dEZ0oxZ2h3T3dTaWdTZGM2ZW45?=
 =?utf-8?B?aFB2N2ZiVGlYQnFEc01BeTRlVkREZWYrcWdMZDBYdjI5T3FxT3NoT1RKOS8y?=
 =?utf-8?B?dUhDOE42ZXhPVDNUV09tVUtLNm9ld3YwU3hpSFg2Y1JhYmxickVsZHFoNG9N?=
 =?utf-8?B?WXRBZUcvcnFmQStubEVVRGNFUFFXQVM5endMN1FuTWFCbG5SSWlXNmFQVmoz?=
 =?utf-8?B?eDdBcmpYQUM0cXpubWdUa0V6RHNoVklZTkpRcFZhLy9DUlRmbjdpWTlUZVdN?=
 =?utf-8?B?SVE1UHorNjJLVm9VTmpqWHJuNFRtVTlLOFVpdm1XOGNIc2JHVkxqZWxTVmQ4?=
 =?utf-8?B?ZC9mdktlb2ZCQ2hVc0E2cjM3djN0T201dXk1c2JRcm8wNVRNVW5Id2hISFhJ?=
 =?utf-8?B?NGdLY2h1cVhzUFRHMEh5RVF3d0lYbEdTdmRFZVdBd0VNSVFvaWE1Y211M0FF?=
 =?utf-8?B?V2V6MlNxSUZMRVc1ZWtnNWRmY0l2cEtKNzhsTHd6UjNnajJ1YXc1ait4WnAv?=
 =?utf-8?Q?EahDogg1Sm/K7UhEySSVEE2GBQ7F6lx6BSXdTcg?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54d4bd09-1dda-418e-9d1f-08d8cc4599b1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3080.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 15:24:17.9657 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5mbweHWsOJya5yP2sqRMaawsYGcf4VtgolFmxFFTey0McWiOYwr3je0prlxWNW9AXK1rYuXSCzUnX2qgyxC9VWAvylpxWEDxAlExXda3gWU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4528
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9888
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102080104
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9888
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102080104
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.2 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/3] lib/tst_net.sh: calc median instead of mean
 in tst_netload()
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 05.02.2021 13:21, Petr Vorel wrote:
> Hi Alexey,
> 
>> This series of patches is intended to improve the reliability
>> of results in network tests that using tst_netload().
> 
>> After TST_NETLOAD_RUN_COUNT was added, we get several results (5 by
>> default). The first patch allows all of them to be displayed along
>> with the final result. It helps to debug test performance failures.
> 
>> Further patches replace the mean calculation of such data set with
>> the median one. It allows to exclude extreme points from the final
>> result.
> 
> Thanks for improving stability of these tests!
> I've also noticed often failures in net.features and some of ipsec tests,
> this should help.
>
> FYI as TODO I'd like some of net.features have also as functional tests
> (ignoring the performance).
> 

Merged, thanks for review Petr!

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
