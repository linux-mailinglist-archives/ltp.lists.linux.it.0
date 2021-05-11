Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB8C37A76B
	for <lists+linux-ltp@lfdr.de>; Tue, 11 May 2021 15:22:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8E9B13C8BB0
	for <lists+linux-ltp@lfdr.de>; Tue, 11 May 2021 15:22:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AB6673C4E50
 for <ltp@lists.linux.it>; Tue, 11 May 2021 14:58:51 +0200 (CEST)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id CA0D3600C6D
 for <ltp@lists.linux.it>; Tue, 11 May 2021 14:58:50 +0200 (CEST)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14BCo3cf008772;
 Tue, 11 May 2021 12:58:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=LiGOwMBW9gZaFKeC8V2Au1qXw5cmU9a/9TpBG1TsWYs=;
 b=vfGbD7VaLpHfihTR3V3RzFyT5HKkhNCwG1PKWb5IavFEATWl7QJdyKskJtjOtqKBn6bs
 iLhCiD4/La39Zc2ARqlyEoYodQk+AlWJ7IPZvek2+IMYzVbFMaj8vrGjeTJWP4OI9E/y
 7yM2pHpeZPICMREDpaSrYRHqk6g/v/iMnNWsIqz8Gdztkjn29ooZoHEA+Ou5wYzumQqx
 cUkob6c8/kQMUsjfsO6w5XklqunKmrQTrqKqi0eKdsCNwJMHhzHXfi8nKMFQXXNhPbMu
 UrWvgEFdd5C2qGxBb0xHDzAAfOmaJPUm+wAIpqE10x26/vc7cC5XfEZ4WW3fDdrLIxQl OQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 38e285dum0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 May 2021 12:58:15 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14BCtoEj094169;
 Tue, 11 May 2021 12:58:14 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
 by aserp3030.oracle.com with ESMTP id 38e5px7as5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 May 2021 12:58:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oz2VVX+LHMnOcxXKWAjnmtK1uONiJ0v2m2NCB4m237Ocn1QOqibns4G2qcoFXXTbqApu1niO61tBoB8SUOa5wAXQ99jgwoeFNYkdPvlpygH9Kjz7/vrkQQpaE6/i5Xxxc54u9SqKFhJgToOPylGz6bg2vFJHPLUgA8p+hK//QtmnT0OSHJZfUc4o9g6ChJq3S178Gysp69V2fmRCHXwcGA5pa0end/cJHY4bVtUQbgLgDgTjbdC8vNpUo/EtffPvA/fo/VE44loYMsQBIa8LoJWPPxFI8MBOjw5oOJyGP/vThRHvOh/nsXvEGxJmdbvjtfp6ljvQLEBJg9h0dDqVfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LiGOwMBW9gZaFKeC8V2Au1qXw5cmU9a/9TpBG1TsWYs=;
 b=KefElMzC8oTQfGqBIwSjC3nyCIutJ09IW+p3LOHRKFBr/K4QlmrRoAdanpMtVGMJ/hZ94XpwvNW3h0copMRB9F35q4P4LFBRiSDnIiaK+JnODHsNa0Ztb4DLYxRyUN2xD7TZnAWgy/qoTFExfm46AyhT+aNcTDelMzuKBLXKUynEe7B5qSYyK/ReuijSf8zC5cN8VRMMTtMzcZrBNOC+32SbPyNjtk+iOwGKkHljby5+pThntnZoSi8L9dcMeVCMO8ALqUB8Eqk45q8vnNrbAPo1tud3VUApAEX+wGle4quzhWKu0LEzxNbGVCuvyd6qrWZvCxMAGmCganvaHeNNyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LiGOwMBW9gZaFKeC8V2Au1qXw5cmU9a/9TpBG1TsWYs=;
 b=oPh4tIXJ/3ZY6iGPSenD7yTmlude+mYLNudi62CMcBbpEOjsB1QO8GRtx6SvSo+DZrmMWRI4iND+/NTT6m4ZV0AcxtgNp8jEVH33BVV/m/szKAClPjQhKizqso8MTQfkUx97mX1TH4BQaw+p9LU43Y20qxPueG3eKWkoYSH5hk8=
Authentication-Results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3592.namprd10.prod.outlook.com (2603:10b6:a03:11f::31)
 by BYAPR10MB3734.namprd10.prod.outlook.com (2603:10b6:a03:127::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.26; Tue, 11 May
 2021 12:58:12 +0000
Received: from BYAPR10MB3592.namprd10.prod.outlook.com
 ([fe80::2d5f:f33e:169c:db9]) by BYAPR10MB3592.namprd10.prod.outlook.com
 ([fe80::2d5f:f33e:169c:db9%7]) with mapi id 15.20.4108.032; Tue, 11 May 2021
 12:58:12 +0000
To: Petr Vorel <pvorel@suse.cz>, dongshijiang <dongshijiang@inspur.com>
References: <20210511091630.23257-1-dongshijiang@inspur.com>
 <YJp2u+lUy9VMq9Wb@pevik>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <d1dc697b-f73a-3be4-c5df-151aae021265@oracle.com>
Date: Tue, 11 May 2021 15:58:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <YJp2u+lUy9VMq9Wb@pevik>
Content-Language: en-US
X-Originating-IP: [95.161.221.177]
X-ClientProxiedBy: AM0PR01CA0124.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::29) To BYAPR10MB3592.namprd10.prod.outlook.com
 (2603:10b6:a03:11f::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from gyrotron.dev.net.org (95.161.221.177) by
 AM0PR01CA0124.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Tue, 11 May 2021 12:58:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be293f79-2a60-4912-7508-08d9147c6f06
X-MS-TrafficTypeDiagnostic: BYAPR10MB3734:
X-Microsoft-Antispam-PRVS: <BYAPR10MB3734CA061903EC98622165A0FD539@BYAPR10MB3734.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dL5lvFm0176oItMuRMjSR+rMBY1fo9l1iUucoHT7D9D9YK7eUUITEEJtNRv6u9ImFP16qBgDXYV08V4YHLEt5dAVHcfCMu6CA8JSHEn9V55g53ES/HZ12MPJRK+SsnzXhQcABNHC4+G4dTmPXqRiY5uvKiO38j35DgruHhYoZTWWL766+kqnK+PxWmjE/U7n3Ox1vbjda2gU0B4YZzR9zAroKNoABu/LSIOveas5Wt3Yt90dxof7DmMn5dtjsz+onmclFlR3sd2cyh+Rx/v8xoR++i5vXn8CVwarJT9HGPdznQUEeckJOfZRi6Ran6q7l16BNWsvf9bQHcS8Hr2cHkbZ83wSgZxT1AOJH32hkGR22dblpuo2KwI9EmUKGhDDi/Aw9xGhqjRHTSwyXhGFDGVKzX2ZiuIhDyy3ddkrv+TCHnho4Cq8xWLSwtZjO6UeiPtWJFLbEQ9aNfqtFdxE1sbDaQtMgyqCCDRZmjQsUtWmtwZGpQ9IBIiL0fqwRI5PRwe8F9xfBwq3n6FC2HdVYQeRiqDSRjCLJv/6l51jTaCd9GJNhRiHnwzps3QuDbp1Qg3bqCyTEqbEhacykJyZeXlZSkjh0aQYEAvPTqbhBo+FYsjQGXwKPLY6ATZkdtwcCuumqJeIZoWYps6Ixp9uTA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3592.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(366004)(346002)(376002)(39860400002)(83380400001)(5660300002)(110136005)(26005)(8676002)(8936002)(6666004)(54906003)(316002)(4326008)(6486002)(186003)(6512007)(16526019)(86362001)(36756003)(31686004)(44832011)(66946007)(6506007)(53546011)(478600001)(38100700002)(2906002)(66476007)(956004)(2616005)(66556008)(31696002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dWx1N0JrUjJlTFhJYlY1eXdSL25vNkNCejY1bzkzVmhwMFZ5SjF6WE9ZTXBB?=
 =?utf-8?B?Sno2bGlQRTNzd0JaSVpYTmFQQWZoUFpDRmkrTElVL3VTV0V3OXlSTGdWZTBh?=
 =?utf-8?B?WjZuMmw4ME5ZQmw5UytsR3lUZU5iSWUzZTFMV1NDeFJKYUY2SUVralJsZnlm?=
 =?utf-8?B?eGFtQmhVMG9XeHdCcDlKOHg4V2lIRng3S09aNUlpS1JTRVcxbGhzSUdqcE5D?=
 =?utf-8?B?VHZadkN0NDB4NE9oeFlEbmpOVlRGZU9oL3VNbU9CYWF1UWJOb1FXbnVzd3NZ?=
 =?utf-8?B?QXUzcHJjL2UrS01TdzErL0dXcXQ1S0FjMDRZMHoybDhSNDdEYnN0RlV2cGFT?=
 =?utf-8?B?anFPcWc5b2Irdy9tVTFkOVJsd2s2L0Z5alZLcE0xTnZOclBIZXM2aDFYaGVI?=
 =?utf-8?B?RjBZOE93Y0xGV3VDRXArVzNNd09mUjB0MkY5UGFRa1VsNk1NMjZqWkZ1T3pw?=
 =?utf-8?B?MmRkWStOMktnNlI2d3RZR3NIRWZNbDdxVlZSSnlkRW1sdm9kSnZEVThkUEpF?=
 =?utf-8?B?U1NGWDdKcTNXV2tDU09tMFZoY0lOeGJLMDR0SDhVbDRzN2dCNHJWUVgzbXZS?=
 =?utf-8?B?aXFZWlRVSGFselVqMDNnUERObSs1OG1UYjVxZUZ2UVcwVmRiL3JmemVsb0d4?=
 =?utf-8?B?L214UWRIVGpvRFJwOGVySkZXcng5NVBDVWR6NTRsU0I3TVM5QkJ5eWRKWXcw?=
 =?utf-8?B?K3FZWWhlaFJ4TXFOQUFlRFcvY1N1Sy82U0xtRHVSNWVOR0x5cjJQU3VzNjl3?=
 =?utf-8?B?OFlrNTZOM1RFTnQrM2tBa2IrVllvNFNOK0VmMWJPejZCMU00aGJzSndMdVQz?=
 =?utf-8?B?NFNIZERkV2pzeUJrZ2s3b0lrdElCRXBOZ1UrbEExdG1FZnB3Q1RoUmVZVXRy?=
 =?utf-8?B?VjNIazlOdjcvczVSeVp4QkZ2dVVFdUVXbVZ0cUprNXZsQlV5OUQ3S0ROam8x?=
 =?utf-8?B?WTN5d29LZENnZ3ByNjQvYmViMlFVQkh4Uk85S1p2RWdERHVLZ3U3LzNrU1Rn?=
 =?utf-8?B?MVZPVGVRdzlVc0FQVFlweTVRSWxxamRhS2x2TG0zQm1rTmg4bTk4TXVmYVl4?=
 =?utf-8?B?U2cwbnRUWDN6cUx4bjVaZzJjVUhLU3pmQmxRUjNFQUd6NG9VZkcvK2YyV3N4?=
 =?utf-8?B?OXlCOGtsbjVLcGRjUnJuczZwVW1BaUdyZ0ZTWVU0WllLc2VqSCt5NHVacWFw?=
 =?utf-8?B?bk1VS1RZTUdVdTNXb2Yza2VBU0xhTGFNUXpqSGdKZCtuYVJGdjJWSG9zbU4z?=
 =?utf-8?B?dGNFYXB6SG1XaUltSklZdjFWVlVuOVZzYVduT0ZuSEwzSVpvSTBDcXdrT0J4?=
 =?utf-8?B?T0c2ci90TjVlNjVQcEpBeGt1SEFPTVdVZDdKaU43VEJYd0x4ZzVRaFFXay8z?=
 =?utf-8?B?Qy9qNDVvb2ZJLzdTdmthY3ZJQy9NcGZSVWgxeUZjUENlMlpaOFFHazRvMHdU?=
 =?utf-8?B?Vnk2Lzh6c2hMQ1Bwb0pDS3d4Q0ozRitDSk9jOTU3ckF5N1Y2dFdRWlkzL0xj?=
 =?utf-8?B?ZWt4UGtWRXVlK3dBUmozbWVVb3BHUGdSblQwWEJZTDNLYjFPZXd0bnlKNzBC?=
 =?utf-8?B?VWo3c3p5UmhSanpxUTdvd1BsWFJtTWJ4M0l5S1ZQOTZPbUNnMEQ2cTcxellK?=
 =?utf-8?B?Ry9ldU0zV3ZiS2lrQzhnbGpaR0diZlNaQWp2eVhTRHFoWWk4R2FlbkNyaXhm?=
 =?utf-8?B?V1AwU0VBTXpLZnR4cUJHNEw1RDJ0MWVUWGhFZGZiN3htVWhxYWxxSDFFdE1o?=
 =?utf-8?Q?RU9zZEMDswrcnO05Jfzyj7CfTVkXaq1KVCrvx7b?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be293f79-2a60-4912-7508-08d9147c6f06
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3592.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2021 12:58:12.1989 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 09PYG4S7/V3iLwEowzTg+XxtkTBAyfCzZgxUDFlk3doUh7UWbOqiNpM2Qz77qGyV1v2GZFYRm2AdRWRX/KvrXy28cPoNDSAiQYyudAnYuCo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3734
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9980
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0 spamscore=0
 mlxscore=0 adultscore=0 mlxlogscore=968 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105110099
X-Proofpoint-GUID: 9wpMgKqN7koH7aYmT81fOeGEtBMXDPCg
X-Proofpoint-ORIG-GUID: 9wpMgKqN7koH7aYmT81fOeGEtBMXDPCg
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9980
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999
 mlxscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 clxscore=1011 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105110098
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
X-Mailman-Approved-At: Tue, 11 May 2021 15:22:17 +0200
Subject: Re: [LTP] [PATCH] bugfix for network/lib6/getaddrinfo_01.c
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
Cc: Martin Doucha <martin.doucha@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 11.05.2021 15:21, Petr Vorel wrote:
> Hi,
> 
> [ Cc: Alexey, Martin and Cyril ]
> 
>> For test cases (test2 ,IPV4 canonical name) and (test13 ,IPV6 canonical name)
> 
>> The gethostname() API returns the official name of host, not the canonical name of host.
>> The canonical name of host needs to be obtained through the gethostbyname() API;
> 
> Yes, test 2 and 13 fails systems which don't use FQDN as hostname and have DNS records
> due mismatch short name and FQDN, e.g.:
> getaddrinfo_01    2  TFAIL  :  getaddrinfo_01.c:140: getaddrinfo IPv4 canonical name ("foo.suse.cz") doesn't match hostname ("foo")
> 
> It's a bit strange to use deprecated gethostbyname() in getaddrinfo() tests :).

Yeah, gethostbyname() is obsolete, we shouldn't compare both here,
i.e. getaddrinfo() vs gethostbyname()...

> Yes, it's the easiest way to get FQDN instead of just "short" hostname. But
> Maybe simple check if we have FQDN with strchr for dot and TCONF it's just short
> name would be better.

+1, and instead of TCONF we could check the "shortname" that
we pass to getaddrinfo():

>>  	shortname[MAXHOSTNAMELEN] = '\0';
>>  	p = strchr(shortname, '.');
>>  	if (p)

...
> 
> FYI Workaround on systems which do not have DNS record is to use /etc/fstab.
> We should document in testcases/network/README.md that when using /etc/fstab,

/etc/hosts

> well recommended order FQDN and *then* short name is required, e.g.:
> ::1 foo.suse.cz foo
> 
> Other setup fails, e.g.:
> ::1 foo
> ::1 foo foo.suse.cz
> 
> leads to error:
> getaddrinfo_01   13  TFAIL  :  getaddrinfo_01.c:611: getaddrinfo IPv6 canonical name ("foo") doesn't match hostname ("foo.suse.cz")
> 
> and setup:
> ::1 foo.suse.cz
> 
> leads to
> getaddrinfo_01   12  TFAIL  :  getaddrinfo_01.c:594: getaddrinfo IPv6 basic lookup ("foo") returns -5 ("No address associated with hostname")
> 
> The best would be if the test checked the correct setup itself
> but not sure how do it to not complicate this test too much.
> I guess during rewrite of this test we might decide to split it.
> 
> Other TODO (not related to this patch:
> e.g.: it fails when there no DNS record nor records in /etc/hosts:
> 
> getaddrinfo_01    1  TFAIL  :  getaddrinfo_01.c:117: getaddrinfo IPv4 basic lookup ("myhost") returns -2 ("Name or service not known")
> ...
> getaddrinfo_01   12  TFAIL  :  getaddrinfo_01.c:599: getaddrinfo IPv6 basic lookup ("myhost") returns -2 ("Name or service not known")
> 
> Any distro installer should add them, but I guess we should TCONF in this case.
> 
> or when there is DNS A record, but not AAAA: 
> getaddrinfo_01   12  TFAIL  :  getaddrinfo_01.c:596: getaddrinfo IPv6 basic lookup ("myhost.suse.cz") returns -5 ("No address associated with hostname")
> 
> During rewriting to new API test would deserve cleanup, e.g.
> remove duplicity in gaiv4() and gaiv6() (getaddrinfo() can deal with IPv4
> and IPv6 in a nice way through hints, see safe_getaddrinfo()).
> 
> Kind regards,
> Petr
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
