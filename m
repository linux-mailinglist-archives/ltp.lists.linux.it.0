Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A78314F59
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Feb 2021 13:45:39 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3E1313C667F
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Feb 2021 13:45:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 621E13C62A2
 for <ltp@lists.linux.it>; Tue,  9 Feb 2021 13:45:37 +0100 (CET)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4AE10600756
 for <ltp@lists.linux.it>; Tue,  9 Feb 2021 13:45:36 +0100 (CET)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 119CZVmV008807;
 Tue, 9 Feb 2021 12:45:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=X45lBbQoL7iy+v86erj4hmXI9eeK8Nd1igclWrudIRc=;
 b=JnuTLDJe69u0W/E4J/bWoGVZFI8qaRtbDTLsHqgudrqzA7Y020Y/k3LcjZbb9Afzqdck
 NZa9ME+HVnMI7NDTYaioRoHXRdOOxJ//upQTJVJHQopw2+ORTYaGDRVSQ85mHH7f9tdE
 qg9d92RG+0pgHqSwef3Kau+mip4WhxH0wDOMZG8cpUw/0fChB51PyAPpitjdmtbzEFn1
 TZpgih/rvEi/jieaF7AN7AJJXMQ2AivctwKrbVUl4IYsEXj5fHhonrOpWbbTkVWOOPgD
 gXtduY+XuFoufY8qHKjRRslwrbDkDJBUrwoZJnDFD9QadO8dFQOxsArM/jk2MlzM4yCY sQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 36hk2kfb2n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Feb 2021 12:45:30 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 119CYrXV116125;
 Tue, 9 Feb 2021 12:45:29 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
 by userp3020.oracle.com with ESMTP id 36j4vr95h3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Feb 2021 12:45:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mJGiuFyL9H+RV0r9+HLIavvajMIIzdxM6tSQdvUGhQ0TjmwDIDxbGWzwmXdBc5WYqXC6QJ8cNT7+6wW0aLuoH7BSArm5nSmYPBiPtQo14AsbDnob7cMUleJJaXLbq0d2Bkm8+ffSWybQW8i9RBtYjPkBwstmu0E6m0R9CsQpsx+QpWs4NeFXPZAoEOmLMzdJ8nn21qTET3UJkAeKOsIrnxY7hvVXOsfSSAgnFk6jMQ6FW7WVbhUGRjoBiYrQtHLXjnvCM7Kzek3+POCEBDe1gZT3kOei3NRW9Cx3t+8fNTRjQijReEhMVDwSK0dUlkGJVq24lh3fmcj23hzeJdj6TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X45lBbQoL7iy+v86erj4hmXI9eeK8Nd1igclWrudIRc=;
 b=SGANQCi23t26i1EfNgqCVeOM8cXMDiZsoX42FaL4nJpV0e9w33X5kO4QLthHL5sDQRZMsfmJYneFmG2QtFqaya0td/HwoXeGCSRyblhvDF6cr5YLWOFO3D7CTfGaK2jYLBmngzR6+i3PLeKObVxC8lYxpyohEWMZI+WQMHlT0jc8s982elfeLsPHV/A0O2Bd90vY//nfYg3mutK3AHrvZOGvRhuWdPJ1Fcn0bA+ho0rx69qnKNoaigOdnOsgOOT9goGee5NAaj18K0Ep7Ct4ftHQeOI99f1ndUPI0ck2yuLZyfB9Avb/4401ldmEecM73+ePrjc9T2/8ItcgX357OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X45lBbQoL7iy+v86erj4hmXI9eeK8Nd1igclWrudIRc=;
 b=vyGv0jWhMvu8h7ZpdeHzwyLSjedblFrNalNsJlrWYPZhAnyaLl1RZzNJoEPvFzYIX4YDs44bB9Ea8fV2ILquMTFLkEarspRlnb67enOvWjXgpKMXpdjfKz8W5s/fwrMBFgb2tZ2TCtJ48mJrlo5LMk59j8i5vzh8qMINjWfg02o=
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3080.namprd10.prod.outlook.com (2603:10b6:a03:87::13)
 by BYAPR10MB3495.namprd10.prod.outlook.com (2603:10b6:a03:11a::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17; Tue, 9 Feb
 2021 12:45:27 +0000
Received: from BYAPR10MB3080.namprd10.prod.outlook.com
 ([fe80::71bd:d013:6c98:9bd2]) by BYAPR10MB3080.namprd10.prod.outlook.com
 ([fe80::71bd:d013:6c98:9bd2%5]) with mapi id 15.20.3825.030; Tue, 9 Feb 2021
 12:45:27 +0000
To: Petr Vorel <pvorel@suse.cz>
References: <20210205142051.32055-1-pvorel@suse.cz>
 <20210205142051.32055-2-pvorel@suse.cz>
 <c5322d13-c69d-aa4d-193c-7c047a405d9a@oracle.com> <YCFhIs/lyRGTh8IR@pevik>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <45f388a1-4c96-d35c-8c61-879631fcae51@oracle.com>
Date: Tue, 9 Feb 2021 15:45:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <YCFhIs/lyRGTh8IR@pevik>
Content-Language: en-US
X-Originating-IP: [95.161.221.177]
X-ClientProxiedBy: AM0PR04CA0073.eurprd04.prod.outlook.com
 (2603:10a6:208:be::14) To BYAPR10MB3080.namprd10.prod.outlook.com
 (2603:10b6:a03:87::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.35] (95.161.221.177) by
 AM0PR04CA0073.eurprd04.prod.outlook.com (2603:10a6:208:be::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.25 via Frontend Transport; Tue, 9 Feb 2021 12:45:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54c7f0c6-7c84-4813-1708-08d8ccf89361
X-MS-TrafficTypeDiagnostic: BYAPR10MB3495:
X-Microsoft-Antispam-PRVS: <BYAPR10MB34955B8B3C9F370397B56A5CFD8E9@BYAPR10MB3495.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cnE6yFLFXlKKaKCEtdRASFk93h0PqBrsF2nvVQcOMfvLhpLUQX69yKXtx7Jz/YEVGs2wu1eKVvD5ZdMeGGw1QgTuXOD5V/w0UOL72zx/vwn7PIw9TChMPqKbLW3mpantM+IXjApxlP4czxhtq/eDH3hV/YVzizVzCf0bjKmq1VGfyOsYoB4cLlLBgTvk6ha6v9XShTYtdfLrWnwGw7jFberrmZMrwGbMWiLBXUAbeUhzbw7P+jknCMIEmc6q/uMB4ux1oalokFzq13WFWKmpF5qad/uOX/vBruYAzi6F58Hi0CBj+VrF6Oei3/QaWjrc7EdsulzUl2xIuzvsg1sG+xIIQ+56YIFYteAyoo50vk/wfz16vL3oDnWeVItbiAXCmD9jsedD0UHxg4uTXiu7Xz5wKFWtpVlXYugNHhjjJqMUQJdYCxVskMoGnEUc2V1Aa1JDDRyVl91blPoskMe/5AfaB8yABN+jtoPl9PaDiV7Ms0TUeQwldxsGfUe5CrX990HZEF1n/uENKCWaiu+dl8eYE9Pxw4QcuFzeWIu89RBpWouQ3k0p/N4oV2+43oK9d/eezEC1d1SOh3y8jhvwaTS4MwPEMrigJE6WCxNx1Yc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3080.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39860400002)(136003)(396003)(376002)(346002)(8676002)(66556008)(66476007)(66946007)(4326008)(2906002)(4744005)(31686004)(53546011)(31696002)(44832011)(2616005)(956004)(316002)(86362001)(16576012)(36756003)(8936002)(6916009)(186003)(16526019)(6486002)(5660300002)(6666004)(478600001)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?a0Zta25UU3o0bjFyZzBjYnhzK1RiNExxdkdGYUZFWWtVTHJIQmRiNUlqdFVx?=
 =?utf-8?B?NG9xZVN1WDkraHQ2NG1ncEpObTRQQ0NMd3h6eHJhL056VGNBSkdnMFU5RVph?=
 =?utf-8?B?WDNuUUl3OFh5NWFhMlNWbU1TZGhpaW91R0hyK1dpaStQa0lJVGtyUURGV3NY?=
 =?utf-8?B?c2VvdUF6VURFYmc0cDlpYWdVL2JLSUh4VGpSL1ppc2pwYTRtUGpSTDVmTnFK?=
 =?utf-8?B?ZzZyZHlKa1FabjFXMHNKMVVRRzFRNFNRSkdMdHIvUWpPY2xWRkxDU0JTMkYv?=
 =?utf-8?B?OG8rMnh1UVRxS21TQXpta1VGYkFnTGtpU1E3WWtGV2syTndvaHcwc3ZRQ205?=
 =?utf-8?B?ampYdkwrb1lzNDhkV0dXbk1wV1J2N2pRbThqR1JFaENxeTJ6WjRTbS9TLzRv?=
 =?utf-8?B?Y01MODZHZzNVMGlDSGFHdEE2R28xNDJjV2VJeEZUcFpTeldyVERzdjN2VWs3?=
 =?utf-8?B?UnA0L1ZaOUlUS2NZWXZLMnRMYi9HR2I1aUtPcHh6dFhaK0RCODZwdC9mOEVY?=
 =?utf-8?B?ckZwVnRIbkQ2VUd0czgrbjhOemdITW5qTlFPUmNndEYvZ1hTM0hTNisvVlJv?=
 =?utf-8?B?eXppWnY3TkpFSmZuaDZOSHNmWlJRcStyb3ZRQWxLK2g5T3B2cHF2THBMMHB6?=
 =?utf-8?B?RzJYV05obEJlNzhROWhSNmNNZnA3RmZkWlpFN3VveTd4bjBUT3hQbmh1R1h5?=
 =?utf-8?B?cE1TVFlTRDdPanY1bVdYMDN5SWdIY0ZEdFgxY1JTd1J0VVBDY0RIZG1FMHVG?=
 =?utf-8?B?YVk4SGxQUFVPbXhDblNkUFh2Q2ZNemhhMWVSbDRVeE5SQ3VTY3NKSHBuc3hw?=
 =?utf-8?B?SWZzNFNWdTZ3U0JuMGxrSGdXSk5xbnhRcHlWZGJTek5YMmZUMTNoWHVJWXQ2?=
 =?utf-8?B?L3FVa3ZTZ1VUblBNWCttaEtPZk5DRTQybDQ1UHlHR0VyVGpSTFNvZkJDRnNo?=
 =?utf-8?B?U2FkZ0JrZWtSa2cyZmdlblBUdE1FSjZkc1djbll0bXNOaGRIaWZscG41Vzdu?=
 =?utf-8?B?eFV3UWVSeElNUVEzWnI3eU5LVTdQaFJHek9BUWdHYzU3cmt2c3J5TUwxOTVD?=
 =?utf-8?B?dVpHV0I4RzRPWjVKSnBFL1U4M2NhWGE0Um1FUkIxV2NGbmdUak9yWDlMWGRm?=
 =?utf-8?B?SXFYc0o0ZzNjdEdadWVqMUwwWGRNb0NQRG1hY3piZU5hN25TWjA2aHdPVHNT?=
 =?utf-8?B?YngwVitlTHhnZXdqVGUzUlYxdmVtbmZ3bm1Eem1jWDFOYVVTdE56Q0thdHVV?=
 =?utf-8?B?eCtGY0ZSUWNFd0hPZHpsbnI5cTBBY1FBS1RQL1hrSjE4d2pSYU5IcklwZ0hE?=
 =?utf-8?B?Nm9hRGIwMVRjdVRpWTRDTi95U2VpTmNUMWhQVjNlY0c4MVYya0RseGtQWTVh?=
 =?utf-8?B?OG52SUFaZzFVcDAvQ2pZanNyQjRuakk3eXdjQlk5RDhzYTNIbnJ5VmMzTUx2?=
 =?utf-8?B?cVVQeGZrZXI4eDkzd2Q1dDZYRlB1ejBMK04yT2FrcVN5VStRRWZ6azdySVZS?=
 =?utf-8?B?MEU0RVdyYldONWYzdEVISkYxSU5nWlRTY3c5emE5cUZOcmZUL0FKWkJYRDBw?=
 =?utf-8?B?WEdJT25VK2RFVkNrYVI5OENNOWIrSzR6RG9iaGNsY2ZCM1Z5dTVLWDVtc0VN?=
 =?utf-8?B?aEJnSklMTkFQam5sTnlKTW9jWkh6eHEyVm9RaUlDVkdSbEZyUmd4QS8za1dP?=
 =?utf-8?B?L2dia3dQdEVZNzhUMkFIekEyVWcrTjJjclZhQ25sN2cyR1VBYVlNSmowdGRs?=
 =?utf-8?Q?14sslXi6hqHjN5xVnjoNNF0nRlnNLz1gTBzD3p9?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54c7f0c6-7c84-4813-1708-08d8ccf89361
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3080.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 12:45:27.1013 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sujzSp+1GdZQdddThS4ap9F7TqcaXrnf3PXPfTQV7KHtoUcrG+PWth98F6LahCAq/FoWXI/x9Hu/nmk+kiBJvI3Gm/8TJlNoJr6qZqMh0lE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3495
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9889
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102090066
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9889
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102090066
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.2 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] if-mtu-change.sh: Lower CHANGE_INTERVAL for
 netns
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

On 08.02.2021 19:04, Petr Vorel wrote:
> How about allow to overwrite CHANGE_INTERVAL even for netns?
> i.e move tst_is_int $CHANGE_INTERVAL && TST_TIMEOUT=$CHANGE_INTERVAL
> after the test (although it's unlikely anybody would use sec value for netns
> and ms value for ssh):
> 
> # CHANGE_INTERVAL: The interval of the mtu change
> TST_TIMEOUT=1
> if tst_net_use_netns; then
>     CHANGE_INTERVAL=${CHANGE_INTERVAL:-100ms}
> else
>     CHANGE_INTERVAL=${CHANGE_INTERVAL:-5}
> fi
> tst_is_int $CHANGE_INTERVAL && TST_TIMEOUT=$CHANGE_INTERVAL
> TST_TIMEOUT=$(((TST_TIMEOUT + 30) * MTU_CHANGE_TIMES))
> 

Yeah, looks good.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
