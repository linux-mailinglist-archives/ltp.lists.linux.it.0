Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 741403165C5
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Feb 2021 12:56:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A49C43C6EC1
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Feb 2021 12:56:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 655F53C195A
 for <ltp@lists.linux.it>; Wed, 10 Feb 2021 12:56:29 +0100 (CET)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 667661000B76
 for <ltp@lists.linux.it>; Wed, 10 Feb 2021 12:56:28 +0100 (CET)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11ABsZGQ002355;
 Wed, 10 Feb 2021 11:56:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=s6KuTHqR7KVf3ODZluVuEIgIAqlITzx867DvVVXUr88=;
 b=cqEmHEBS7oY1cLUazutDCuiSDrDQ78uRl2X3DFgNQd88eD6oK0MSNemvVNlqNvnUcOVn
 AaP6sQylRnqbGxsDicW9r8VpO/78M5DqDKV8D7IwMr5rdnZySMll9ymmyeIwEUQeVBlC
 eLMl9noZbCbosF3FDL+8Cvu3HamSg69ZB/tWYttxo7gP3UWmFQ2AICai54nlnS9kldYq
 +VsdF31HCf9fTC4qi1wb2P7xbkQ9nQklgyxCaLpoq6H8pBQ5DmS3Dzy/4E0Btk1u4GgF
 hDu5hkTLtnVgVUIDs9xm3QhPlFCbQS+MD6HAc1dBPf+3nHit7oZFw6MOf/4/7TLQWHrA qQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 36hjhqu467-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Feb 2021 11:56:23 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11ABsg2D189704;
 Wed, 10 Feb 2021 11:56:23 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
 by userp3020.oracle.com with ESMTP id 36j4vsq3k3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Feb 2021 11:56:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gobt+CJf9CRhBhkR0pfh2gulWZWW4jGWeW7vhv9khz9Wd6ceevx8TNbvZgCTGftySuixMltdja2iR+pj0+BdL31iT0f6Q8vSTD0jonWGLEdkXfUdhCAVbgSBeQniOAZr+Aeo66h3UZyZouVLFhfhsPB95xTaiz4oOIv0cPvhK6idsVhsqlnKYkc/pwljZp2FBMXP7X0Yl5aQg5e490rKfW99v4uaEn79W2KoYRLKgSTq++SoLRK7FHjPAuv36GXvKrR7bXIuN244dc8xAtfcAuLLPp+fygpH7/K0cHQ0ph1Uk5UjxD6dmALKDOMjFEOg9+3TnPqH+fAkf/hdm8D/aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6KuTHqR7KVf3ODZluVuEIgIAqlITzx867DvVVXUr88=;
 b=laE+X0uIj/2VeCZ0Cqr7A3HleJ8j+XfGRJClPxWB/kwz19hIDwNl+9YUfXv2KFyMEpulo2/UmojwtC/z4ssUJvLvhsh2Pn8uKirb4JX+YEwOR4xGeEaOOQrBCmB1KHX9AEJR5oyhYNYTvpiKeCF9v37UqJ7PX8Lwv0uPfbU4MXrcNNKWqXmsM74k5RcsifJbgpX09tY3Y5gXgUO7XbMdRnIpTWlzoML/n9JslxS7Ju1L8MWhYRGB27kcBesVmAc6yvyf4EXA4o37Zmqt+3kQozDYFHtYfM7NshdRICGTPox0TWNkczrsQRcipaaXYWpD59ypbYU9W/21iDkue54JlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6KuTHqR7KVf3ODZluVuEIgIAqlITzx867DvVVXUr88=;
 b=rKu+ipe534Pc8rMdg267CZ7bH8wrh6ogML1RQf0Gf80Y/6bVs4SiUiTCQtiXUQuXDEBtAsKwcGp3Kd9AWc92lRftXPR4BODX8VulxBKfP8JKRh2AwDSnM2I/mhkbsG/BJLIOGRBrKp6JJvBwzDhO2aoDQxV2XJttpWI6J1pK+TY=
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3080.namprd10.prod.outlook.com (2603:10b6:a03:87::13)
 by BYAPR10MB2741.namprd10.prod.outlook.com (2603:10b6:a02:b3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17; Wed, 10 Feb
 2021 11:56:20 +0000
Received: from BYAPR10MB3080.namprd10.prod.outlook.com
 ([fe80::71bd:d013:6c98:9bd2]) by BYAPR10MB3080.namprd10.prod.outlook.com
 ([fe80::71bd:d013:6c98:9bd2%5]) with mapi id 15.20.3825.030; Wed, 10 Feb 2021
 11:56:20 +0000
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20210205151015.7465-1-pvorel@suse.cz> <YB7qefsNWbCJXUEu@pevik>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <5f9aecc2-096b-6b24-bdfa-f9d361fcbac7@oracle.com>
Date: Wed, 10 Feb 2021 14:56:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <YB7qefsNWbCJXUEu@pevik>
Content-Language: en-US
X-Originating-IP: [95.161.221.177]
X-ClientProxiedBy: AM9P192CA0008.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::13) To BYAPR10MB3080.namprd10.prod.outlook.com
 (2603:10b6:a03:87::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.35] (95.161.221.177) by
 AM9P192CA0008.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.27 via Frontend Transport; Wed, 10 Feb 2021 11:56:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b9b5535-9590-4e41-58d4-08d8cdbae13c
X-MS-TrafficTypeDiagnostic: BYAPR10MB2741:
X-Microsoft-Antispam-PRVS: <BYAPR10MB2741FE972B80B9F229782AE0FD8D9@BYAPR10MB2741.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 76+lP5CwLXNs9Z+PAiNAv2M1mpHA93gdQOZ//wfKqLoBowLIer536gJusQYaBqwvDkEMMQX0R5/9QM4KmPKRYEHDsGNUPr6Qw0c7H91ExJYQjoU4xen37vWGRfM+ZPzkK7QwX1QGhj7gTvTppXzCQX/AcJXd4jiPLgNI1s+D2rtg4c6pACv26wvYkymlka8Q00W9viGNPTpmY9vysOfa9XVm8FhiyU+40YunNkq5IBTx+cJrb2fochDP8Sd8gnryl4A3ArVha2y6tGSeIqnKjIzK1Hmdh/9PPDOtV5DBPiuFGhma7obk1zDGqnRvrgGyAcdvw4acdzU5X8gjpN1OWw23hjfChppX3WjkRe2pneJdVCxqycWkJR7Dl1SbPrc2BLQh8UzS51qXedSIGkifxVQ6fbHh+0ab99Rt02VVhU13MdF5oaCPDwGS2xwDc18BEga0wO27CZwuPtySh0svpvOwHzbibhfiDz42v1vZXuKdj2g62HsSjq9XhStGz6hGHUkXAAYB2yv47lWXfONZHDiOIczGSqkskqFhXbO/BqSKv+gK3qGoe0ekSWBoR4MT2juXivCF/qFne1iXC2q3E8oRR1uBof7oCFA3L0vHKBA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3080.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(39860400002)(136003)(366004)(396003)(6666004)(8676002)(2906002)(44832011)(31686004)(66556008)(66476007)(53546011)(2616005)(956004)(478600001)(5660300002)(26005)(86362001)(8936002)(6486002)(66946007)(316002)(16576012)(31696002)(186003)(16526019)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UUppVVZPUnZHMm5HbzEzcmhtQm96WkJXNGVLYi9KdEpUdXlQTXpmcjRSZFRQ?=
 =?utf-8?B?OWZ3ekdGekV1K1F0M3VNTE44WTJFcGRRay92aWdKeTNZdmZhL2RZeWtvZ2l4?=
 =?utf-8?B?b0xXQVM2YmNvZWFrd1RuNVhydmthRkRsZlhVaGJWZko1YndvdGJaRXZKNEpv?=
 =?utf-8?B?WTVJV2hyVjFjTkU3ZjBoTXV3NGxNSDlTd2RFK29uUzZjL0hHNCtFQWxxeFJh?=
 =?utf-8?B?TjhxUEN1ZHV3NUw4R0JLdm1TdmZQTFBDdXF2NG5wVXNSR21tUW5ISnd3VDJI?=
 =?utf-8?B?eDZpWjU3YVQvYjlFSXBpaUtGYVNIdktIb3FWRUJMdVVpcDEwUE13aldUREFV?=
 =?utf-8?B?N21PUHNpNTlScnU1U0cvMitFZ1pZQmZKdDFPdG4zUFR1clRCOTdCbS9VdG1P?=
 =?utf-8?B?S2JrK1JKYTNuNnJMVUJETTdpSGQwb1N6RklpRzFleHRhcU83cXA4Wk9pdmFJ?=
 =?utf-8?B?WmdqbFpjaEdMWWZkWGFXMEdDSkdyTDB3dmx4NnVVeUpCT2ZzZkovT0Y2cjkv?=
 =?utf-8?B?eDJtTFRjVjI4N0ZIRlZnVHNBV1E4N3VUbjZHU3JOS0lUN0h0UHNaNUxGclhK?=
 =?utf-8?B?eDhJSC96c2xzcTU1WWVVZytlR0VGQU1QbUducUlKTXdpa1BUMktmWXBWUDVs?=
 =?utf-8?B?MkdRVkk3aUpzaFh6aUwxRXdpblFNTHJyT3cvTktwUWUvTERxcm9Rc29zbHRL?=
 =?utf-8?B?RkNzRzUyMHRqc1JIUWp6SVBZVkpkd3puTkFhVE5DOUY4bm9FRVFPSEY0RHFT?=
 =?utf-8?B?L2t4VVV4VFJQcVNadnNTOFNVTFVVdlgyemExbHBTMXIwV2lyanlpdGt0UDln?=
 =?utf-8?B?ZmkwUTdlY09hNTZMVU9Ua2czdlRzY0pZeWQzWmVOT0FiK3ZoU1dDSUZYR0Z3?=
 =?utf-8?B?aXRXL3l2Z2RUVk5hNkJ0d2FqbktQZ2dWRjFKakcxeUYrY0U1M0oyVy93Z0E5?=
 =?utf-8?B?dlhxbFZLTWJJdDhnUUZtTEJUdkZUUUcveWhoNzRqMU5VcGs5Q2xQZlh5Qllv?=
 =?utf-8?B?ZnBuZS9nanVSSTJ4UlNxV3RrMHlEMFJYSlZrdGxyYVhTSnd6K3E1dHY5OXJh?=
 =?utf-8?B?bG1kdzIxbk9kWFhHOWgyTzV6ZUczUDRNR044SnBLdktiWkdZRVpDTngxSE1L?=
 =?utf-8?B?OTRjRTE5OUtDNjRYK3luNXpGazdldDdPai9JL0Ztcld0UFVtc21pN0RaTGJm?=
 =?utf-8?B?Zkx4aWkvbis2ekZYWE0rZlN2a1NoTzN3ME1tNzZvSXFIdHlIWGtMM3B0dDJ4?=
 =?utf-8?B?d0xDcGxqcGw2NTZhL2lONzd3OVZSQXdldkxvY092aUcyejI2WUdNL25IbzhB?=
 =?utf-8?B?YURqdDJCR2RQU2ZnMVhjZHB3Rk5ya01ibTBFL0RQaG0wRVpEZ0RNRStxR2xZ?=
 =?utf-8?B?OVJRc2krbDM5a2hheG03VnErb1dkemlYYXhnc1QyVGVEa2NibTU2RjM2UUFk?=
 =?utf-8?B?RkdlSkVUUnNrdWhLL0xYcTNKbkl1djhBY2M3d0tJMEk4UEVWZG95UC8vNFYv?=
 =?utf-8?B?M0IrYUZtaDdoNTN6ckt3cFhYbkRUWjJwM25xTkRWMGgwMVhBczJnV24reUlG?=
 =?utf-8?B?RjcxUGFlck81Q29KTS9hRFhvcmN0QkduWW93YkhjSDRxejRTeVllNFpaTXYw?=
 =?utf-8?B?V0xGOEFxb3RDVEorMGdxa3hLZ05ERHZtZzFIcDZFZ2V0c3BwTDA4dDZwRHB6?=
 =?utf-8?B?R2lFTUR3bk84UHc5S3lFZ3N4VWlIbDdlUGFMNnE5cFBVV1U5UnRrNDdIRGZQ?=
 =?utf-8?Q?XclJ6GKZhipfyYMcJoZohDqW6zI+1Ce22khE8KS?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b9b5535-9590-4e41-58d4-08d8cdbae13c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3080.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2021 11:56:20.0694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n4LRiEnOm+PPQFuF2l7+CTgbbvyB1NfFFSH/hcdEIivVwiXzzx/4VgsUniz+7tUVsUZb+59gX8WnS9Is6cv51ymjr/BeNytDjCeGjBVZ+Ws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2741
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9890
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102100117
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9890
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 impostorscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 mlxscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102100116
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.2 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/4] net/multicast: Create mcast_setup_normal()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 06.02.2021 22:14, Petr Vorel wrote:
> Hi,
> 
>> +++ b/testcases/network/stress/multicast/packet-flood/mcast-pktfld01.sh
>> @@ -8,14 +8,11 @@
>>  # a single socket, then receiving a large number of UDP packets at the socket
> 
>>  TST_NEEDS_ROOT=1
>> +TST_SETUP="mcast_setup_normal"
>>  . mcast-lib.sh
> 
>> -do_setup()
>> -{
>> -	mcast_setup $MCASTNUM_NORMAL
>> -	MCAST_LCMD=ns-mcast_receiver
>> -	MCAST_RCMD=ns-udpsender
>> -}
>> +MCAST_LCMD="ns-mcast_receiver"
>> +MCAST_RCMD="ns-udpsender"
> Actually, this is wrong.
> Variables must be set after setup has been run.
> 
>>  do_test()
>>  {
>> diff --git a/testcases/network/stress/multicast/packet-flood/mcast-pktfld02.sh b/testcases/network/stress/multicast/packet-flood/mcast-pktfld02.sh
>> index 76d184995..2c356917a 100755
>> --- a/testcases/network/stress/multicast/packet-flood/mcast-pktfld02.sh
>> +++ b/testcases/network/stress/multicast/packet-flood/mcast-pktfld02.sh
>> @@ -9,14 +9,11 @@
>>  # packets at each socket
> 
>>  TST_NEEDS_ROOT=1
>> +TST_SETUP="mcast_setup_normal"
>>  . mcast-lib.sh
> 
>> -do_setup()
>> -{
>> -	mcast_setup $MCASTNUM_NORMAL
>> -	MCAST_LCMD=ns-mcast_receiver
>> -	MCAST_RCMD=ns-udpsender
>> -}
>> +MCAST_LCMD="ns-mcast_receiver"
>> +MCAST_RCMD="ns-udpsender"
> And here as well.
> 
> Fix is to move it into test function.
> 
> Kind regards,
> Petr
> 
> diff --git testcases/network/stress/multicast/packet-flood/mcast-pktfld01.sh testcases/network/stress/multicast/packet-flood/mcast-pktfld01.sh
> index 1db7b0605..1b9fe9d79 100755
> --- testcases/network/stress/multicast/packet-flood/mcast-pktfld01.sh
> +++ testcases/network/stress/multicast/packet-flood/mcast-pktfld01.sh
> @@ -11,13 +11,13 @@ TST_NEEDS_ROOT=1
>  TST_SETUP="mcast_setup_normal"
>  . mcast-lib.sh
>  
> -MCAST_LCMD="ns-mcast_receiver"
> -MCAST_RCMD="ns-udpsender"
> -
>  do_test()
>  {
>  	tst_res TINFO "joining an IPv${TST_IPVER} multicast group with a single socket, then receiving a large number of UDP packets at the socket in $NS_DURATION seconds"
>  
> +	MCAST_LCMD="ns-mcast_receiver"
> +	MCAST_RCMD="ns-udpsender"
> +
>  	local addr="$MCAST_IPV4_ADDR"
>  	[ "$TST_IPV6" ] && addr="$MCAST_IPV6_ADDR"
>  
> diff --git testcases/network/stress/multicast/packet-flood/mcast-pktfld02.sh testcases/network/stress/multicast/packet-flood/mcast-pktfld02.sh
> index ee62b347e..9b5de60db 100755
> --- testcases/network/stress/multicast/packet-flood/mcast-pktfld02.sh
> +++ testcases/network/stress/multicast/packet-flood/mcast-pktfld02.sh
> @@ -12,13 +12,13 @@ TST_NEEDS_ROOT=1
>  TST_SETUP="mcast_setup_normal"
>  . mcast-lib.sh
>  
> -MCAST_LCMD="ns-mcast_receiver"
> -MCAST_RCMD="ns-udpsender"
> -
>  do_test()
>  {
>  	tst_res TINFO "joining $MCASTNUM_NORMAL IPv${TST_IPVER} multicast groups on separate sockets, then receiving a large number of UDP packets at each socket in $NS_DURATION seconds"
>  
> +	MCAST_LCMD="ns-mcast_receiver"
> +	MCAST_RCMD="ns-udpsender"
> +

Hi Petr,

Perhaps it would be better to move this to another wrapper
in the lib along with mcast_setup_normal()?

mcast_setup_normal_udp()
{
        mcast_setup_normal
	MCAST_LCMD="ns-mcast_receiver"
	MCAST_RCMD="ns-udpsender"
}

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
